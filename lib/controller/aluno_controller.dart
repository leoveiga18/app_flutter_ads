import 'package:meuappflutter/model/aluno_model.dart';
import 'package:meuappflutter/model/aluno_repository.dart';

class AlunoController {
  AlunoRepository alunoRepository = AlunoRepository();

  List<AlunoEntity> alunosList = [];

  getAlunosList() async {
    alunosList = await alunoRepository.getAll();

    return alunosList;
  }

  postNovoAluno(AlunoEntity alunoEntity) async {
    try {
      await alunoRepository.postNovoAluno(alunoEntity);
    } catch (e) {
      rethrow;
    }
  }

  deleteAluno(int id) async {
    try {
      await alunoRepository.deleteAluno(id);
    } catch (e) {
      rethrow;
    }
  }
}
