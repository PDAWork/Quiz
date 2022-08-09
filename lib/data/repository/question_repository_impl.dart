import 'package:victory/data/datasources/question_remote_data_source.dart';
import 'package:victory/domain/entities/question_entity.dart';
import 'package:victory/domain/repositories/question_repository.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionRemoteDataSource questionRemoteDataSource;

  QuestionRepositoryImpl(this.questionRemoteDataSource);

  @override
  Future<List<QuestionEntity>> getQuestion({
    String category = '',
    String difficulty = '',
  }) async {
    return questionRemoteDataSource.getAllPersons(category, difficulty);
  }
}
