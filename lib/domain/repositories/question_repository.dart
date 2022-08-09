import 'package:victory/domain/entities/question_entity.dart';

abstract class QuestionRepository {
  Future<List<QuestionEntity>> getQuestion(
      {String category, String difficulty});
}
