import 'package:flutter/material.dart';

import '../models/post.dart';
import '../services/post_service.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final PostService _service = PostService();
  late Future<List<Post>> _postsFuture;
  List<Post> _posts = [];
  bool _sending = false;

  @override
  void initState() {
    super.initState();
    _postsFuture = _loadPosts();
  }

  Future<List<Post>> _loadPosts() async {
    final posts = await _service.getPosts();
    _posts = posts;
    return posts;
  }

  void _reload() {
    setState(() => _postsFuture = _loadPosts());
  }

  Future<void> _getOne() async {
    final id = await _askForId();
    if (id == null) return;
    await _runRequest(() async {
      final post = await _service.getPost(id);
      if (!mounted) return;
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('GET /posts/$id'),
          content: Text('${post.title}\n\n${post.body}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fechar'),
            ),
          ],
        ),
      );
    }, successMessage: 'Post $id recuperado.');
  }

  Future<void> _create() async {
    final input = await _showPostForm(title: 'Criar post');
    if (input == null) return;
    await _runRequest(() async {
      final created = await _service.createPost(input);
      setState(() => _posts.insert(0, created));
    }, successMessage: 'POST concluido. ID recebido: 101.');
  }

  Future<void> _update(Post post) async {
    final input = await _showPostForm(
      title: 'Editar post ${post.id}',
      post: post,
    );
    if (input == null) return;
    await _runRequest(() async {
      final updated = await _service.updatePost(input);
      setState(() {
        final index = _posts.indexWhere((item) => item.id == updated.id);
        if (index >= 0) _posts[index] = updated;
      });
    }, successMessage: 'PUT do post ${post.id} concluido.');
  }

  Future<void> _delete(Post post) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir post?'),
        content: Text('Deseja executar DELETE em /posts/${post.id}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
    if (confirmed != true || post.id == null) return;
    await _runRequest(() async {
      await _service.deletePost(post.id!);
      setState(() => _posts.removeWhere((item) => item.id == post.id));
    }, successMessage: 'DELETE do post ${post.id} concluido.');
  }

  Future<int?> _askForId() async {
    final controller = TextEditingController(text: '1');
    final result = await showDialog<int>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Buscar um post'),
        content: TextField(
          controller: controller,
          autofocus: true,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'ID do post'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.pop(context, int.tryParse(controller.text.trim())),
            child: const Text('Buscar'),
          ),
        ],
      ),
    );
    controller.dispose();
    return result;
  }

  Future<Post?> _showPostForm({required String title, Post? post}) async {
    final titleController = TextEditingController(text: post?.title);
    final bodyController = TextEditingController(text: post?.body);
    final result = await showDialog<Post>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: SizedBox(
          width: 440,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Titulo'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: bodyController,
                minLines: 3,
                maxLines: 5,
                decoration: const InputDecoration(labelText: 'Conteudo'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              if (titleController.text.trim().isEmpty ||
                  bodyController.text.trim().isEmpty) {
                return;
              }
              Navigator.pop(
                context,
                Post(
                  id: post?.id,
                  userId: post?.userId ?? 1,
                  title: titleController.text.trim(),
                  body: bodyController.text.trim(),
                ),
              );
            },
            child: const Text('Enviar'),
          ),
        ],
      ),
    );
    titleController.dispose();
    bodyController.dispose();
    return result;
  }

  Future<void> _runRequest(
    Future<void> Function() request, {
    required String successMessage,
  }) async {
    setState(() => _sending = true);
    try {
      await request();
      if (mounted) _showMessage(successMessage);
    } catch (error) {
      if (mounted) _showMessage('Falha: $error');
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void dispose() {
    _service.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSONPlaceholder - Posts'),
        actions: [
          IconButton(
            onPressed: _sending ? null : _reload,
            tooltip: 'GET da lista',
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          if (_sending) const LinearProgressIndicator(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                OutlinedButton.icon(
                  onPressed: _sending ? null : _getOne,
                  icon: const Icon(Icons.search),
                  label: const Text('GET por ID'),
                ),
                FilledButton.icon(
                  onPressed: _sending ? null : _create,
                  icon: const Icon(Icons.add),
                  label: const Text('POST novo'),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('GET /posts?_limit=10'),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Post>>(
              future: _postsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Nao foi possivel carregar: ${snapshot.error}'),
                        const SizedBox(height: 12),
                        FilledButton(
                          onPressed: _reload,
                          child: const Text('Tentar novamente'),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 24),
                  itemCount: _posts.length,
                  itemBuilder: (context, index) {
                    final post = _posts[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${post.id ?? '-'}')),
                        title: Text(post.title),
                        subtitle: Text(
                          post.body,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Wrap(
                          children: [
                            IconButton(
                              onPressed: _sending ? null : () => _update(post),
                              tooltip: 'PUT',
                              icon: const Icon(Icons.edit_outlined),
                            ),
                            IconButton(
                              onPressed: _sending ? null : () => _delete(post),
                              tooltip: 'DELETE',
                              icon: const Icon(Icons.delete_outline),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
