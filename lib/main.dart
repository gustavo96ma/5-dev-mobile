import 'package:flutter/material.dart';
import 'tarefa.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  // Declara as variáveis no nível da classe
  final List<Tarefa> tarefas = [];
  final TextEditingController controle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: controle,
                    decoration: const InputDecoration(
                      hintText: 'Digite uma tarefa',
                    ),
                  ),
                ),
                const SizedBox(width: 8), // Espaço entre o TextField e o botão
                TextButton(
                  onPressed: () {
                    // Adicione a lógica para adicionar tarefas aqui
                    final descricao = controle.text;
                    if (descricao.isNotEmpty) {
                      tarefas.add(Tarefa(
                          id: tarefas.length + 1,
                          descricao: descricao,
                          concluido: false));
                      controle.clear(); // Limpa o TextField após adicionar
                    }
                  },
                  child: const Text('Adicionar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
