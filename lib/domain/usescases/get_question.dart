import 'package:victory/domain/entities/question_entity.dart';
import 'package:victory/domain/repositories/question_repository.dart';

class GetQuestion {
  final QuestionRepository questionRepository;

  GetQuestion(this.questionRepository);

  Future<List<QuestionEntity>> getAll(
      String category, String difficulty) async {
    return questionRepository.getQuestion(
      category: category,
      difficulty: difficulty,
    );
  }
}
