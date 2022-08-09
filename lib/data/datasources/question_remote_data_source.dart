import 'package:dio/dio.dart';
import 'package:victory/data/models/question_models.dart';

abstract class QuestionRemoteDataSource {
  /// https://quizapi.io/api/v1/questions?apiKey=j24WhINsXuMG7PszLmbkLHqRiXRoFnjRZrHxkwDa&limit=10&Category=Cloud&Difficulty=2
  Future<List<QuestionModels>> getAllPersons(
    String category,
    String difficulty,
  );
}

class QuestionRemoteDataSourceImpl extends QuestionRemoteDataSource {
  final Dio dio;

  QuestionRemoteDataSourceImpl(this.dio);

  @override
  Future<List<QuestionModels>> getAllPersons(
      String category, String difficulty) async {
    try {
      final reponse = await dio.get(
          'questions?apiKey=j24WhINsXuMG7PszLmbkLHqRiXRoFnjRZrHxkwDa&limit=10&Category=$category&Difficulty=$difficulty');
      return (reponse.data as List)
          .map((e) => QuestionModels.fromJson(e))
          .toList();
    } on DioError catch (e) {
      return <QuestionModels>[];
    }
  }
}
