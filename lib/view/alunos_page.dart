import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:meuappflutter/controller/aluno_controller.dart';
import 'package:meuappflutter/login_page.dart';
import 'package:meuappflutter/model/aluno_model.dart';
import 'package:meuappflutter/view/drawer.dart';
import 'package:meuappflutter/view/novo_aluno_page.dart';

class AlunosPage extends StatefulWidget {
  const AlunosPage({super.key});

  @override
  State<AlunosPage> createState() => _AlunosPageState();
}

class _AlunosPageState extends State<AlunosPage> {
  AlunoController controller = AlunoController();

  late Future<List<AlunoEntity>> future;

  @override
  void initState() {
    super.initState();
    future = getAlunos();
  }

  Future<List<AlunoEntity>> getAlunos() async {
    Future<List<AlunoEntity>> lista = controller.alunoRepository.getAll();
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
        title: const Center(
          child: Text("Alunos"),
        ),
      ),
      //future builder constroi e atualiza o widget conforme o estado
      // retornado pela sua "future" através do "snapshot"
      // ou seja -> em loading, completado, tem dados, não tem dados)
      body: FutureBuilder<List<AlunoEntity>>(
        future: future,
        builder:
            (BuildContext context, AsyncSnapshot<List<AlunoEntity>> snapshot) {
          //se o snapshot atual da future possui dados
          if (snapshot.hasData) {
            //ja cria um scroll view
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Slidable(
                    endActionPane:
                        ActionPane(motion: const ScrollMotion(), children: [
                      SlidableAction(
                        onPressed: null,
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.black,
                        icon: Icons.edit,
                        label: 'Alterar',
                      ),
                      SlidableAction(
                        onPressed: (context) async {
                          //copiar isso da documentação
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Confirmação'),
                              content:
                                  const Text('Confirma exclusão deste aluno?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  //aqui muda/////////////////
                                  onPressed: () async {
                                    await controller.deleteAluno(
                                        int.parse(snapshot.data![index].id!));
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ).then((value) async {
                            //AJUSTAR ERRO NO REPOSITORIO
                            //VARIAVEL ALUNOS FORA DO METODO
                            future = getAlunos();
                            setState(() => {});
                          });
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Excluir',
                      ),
                    ]),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.brown.shade800,
                        child: const Text('A'),
                      ),
                      title: Text("${snapshot.data![index].nome}"),
                      subtitle: Text("${snapshot.data![index].email}"),
                    ),
                  ),
                );
              },
            );
            //senão (não tem dados, está em loading, tem erro, etc) então
            // esse else não é o ideal, pode ser melhorado...
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NovoAlunoPage(),
            ),
          ).then((value) {
            future = getAlunos();
            setState(() => {});
          });
        },
      ),
    );
  }
}
