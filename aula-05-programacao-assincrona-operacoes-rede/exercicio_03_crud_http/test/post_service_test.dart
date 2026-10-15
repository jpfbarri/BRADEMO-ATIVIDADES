import 'package:exercicio_03_crud_http/models/post.dart';
import 'package:exercicio_03_crud_http/services/post_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  test('GET converte a resposta em uma lista de posts', () async {
    final client = MockClient((request) async {
      expect(request.method, 'GET');
      return http.Response(
        '[{"userId":1,"id":1,"title":"Titulo","body":"Texto"}]',
        200,
      );
    });
    final service = PostService(client: client);
    final posts = await service.getPosts();
    expect(posts, hasLength(1));
    expect(posts.first.title, 'Titulo');
    service.close();
  });

  test('POST envia JSON e converte a resposta', () async {
    final client = MockClient((request) async {
      expect(request.method, 'POST');
      expect(request.body, contains('Novo post'));
      return http.Response(
        '{"userId":1,"id":101,"title":"Novo post","body":"Texto"}',
        201,
      );
    });
    final service = PostService(client: client);
    final post = await service.createPost(
      const Post(userId: 1, title: 'Novo post', body: 'Texto'),
    );
    expect(post.id, 101);
    service.close();
  });

  test('PUT envia o ID na URL', () async {
    final client = MockClient((request) async {
      expect(request.method, 'PUT');
      expect(request.url.path, '/posts/7');
      return http.Response(
        '{"userId":1,"id":7,"title":"Editado","body":"Texto"}',
        200,
      );
    });
    final service = PostService(client: client);
    final post = await service.updatePost(
      const Post(id: 7, userId: 1, title: 'Editado', body: 'Texto'),
    );
    expect(post.title, 'Editado');
    service.close();
  });

  test('DELETE usa o metodo e o ID corretos', () async {
    final client = MockClient((request) async {
      expect(request.method, 'DELETE');
      expect(request.url.path, '/posts/3');
      return http.Response('{}', 200);
    });
    final service = PostService(client: client);
    await service.deletePost(3);
    service.close();
  });
}
