import 'dart:convert';
import 'package:meuappflutter/utils/constantes.dart';
import 'package:meuappflutter/model/aluno_model.dart';
import 'package:http/http.dart' as http;

class AlunoRepository {
  final url = Uri.parse('$urlBaseApi/alunos');

  //busca a lista de todos alunos na api
  Future<List<AlunoEntity>> getAll() async {
    List<AlunoEntity> alunos = [];
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final alunosList = jsonDecode(response.body) as List;
      for (var user in alunosList) {
        alunos.add(AlunoEntity.mapToEntity(user));
      }
    }
    return alunos;
  }

  postNovoAluno(AlunoEntity alunoEntity) async {
    final jsonAluno = jsonEncode(AlunoEntity.entityToMap(alunoEntity));
    var response = await http.post(url, body: jsonAluno);
    if (response.statusCode != 201) {
      throw 'Problemas ao inserir aluno';
    }
  }

  deleteAluno(int id) async {
    final url = '$urlBaseApi/alunos/$id';
    var response = await http.delete(Uri.parse(url));
    if (response.statusCode != 200) {
      throw 'Problemas ao excluir aluno';
    }
  }
}
