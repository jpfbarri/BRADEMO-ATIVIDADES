import 'package:flutter/material.dart';

void main() => runApp(const AppTarefas());

class Tarefa {
  final String titulo;
  bool concluida;

  Tarefa(this.titulo, {this.concluida = false});
}

class AppTarefas extends StatelessWidget {
  const AppTarefas({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Kindacode.com',
      debugShowCheckedModeBanner: false,
      home: TelaDeTarefas(),
    );
  }
}

class TelaDeTarefas extends StatefulWidget {
  const TelaDeTarefas({super.key});

  @override
  State<TelaDeTarefas> createState() => _TelaDeTarefasState();
}

class _TelaDeTarefasState extends State<TelaDeTarefas> {
  final List<Tarefa> _tarefas = [
    Tarefa('Task 2022-07-09 18:08:31.734244'),
    Tarefa('Task 2022-07-09 18:08:32.210300'),
    Tarefa('Task 2022-07-09 18:08:32.629026'),
    Tarefa('Task 2022-07-09 18:08:33.073472'),
    Tarefa('Task 2022-07-09 18:08:33.524172'),
  ];

  bool _mostrandoConcluidas = false;

  int get _pendentes => _tarefas.where((t) => !t.concluida).length;

  List<Tarefa> get _visiveis => _mostrandoConcluidas
      ? _tarefas.where((t) => t.concluida).toList()
      : _tarefas;

  void _marcar(Tarefa tarefa, bool? valor) {
    setState(() => tarefa.concluida = valor ?? false);
  }

  void _abrirDialogo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Você está no App de Notas de Tarefas'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Kindacode.com'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() => _mostrandoConcluidas = !_mostrandoConcluidas);
              },
              child: Text(
                _mostrandoConcluidas
                    ? 'View All Tasks'
                    : 'View Completed Tasks',
              ),
            ),
            const SizedBox(height: 12),
            Text('You have $_pendentes uncompleted tasks'),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: _visiveis.length,
                itemBuilder: (context, i) {
                  final tarefa = _visiveis[i];
                  return Card(
                    color: const Color(0xFFFFE082),
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              tarefa.titulo,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                          Checkbox(
                            value: tarefa.concluida,
                            onChanged: (valor) => _marcar(tarefa, valor),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirDialogo,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
