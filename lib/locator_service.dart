import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:victory/data/datasources/question_remote_data_source.dart';
import 'package:victory/data/repository/question_repository_impl.dart';
import 'package:victory/domain/repositories/question_repository.dart';
import 'package:victory/domain/usescases/get_question.dart';
import 'package:victory/presentation/state/cubit/question_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => QuestionCubit(sl()));

  //UseCases
  sl.registerLazySingleton(() => GetQuestion(sl()));

  //Repository
  sl.registerLazySingleton<QuestionRepository>(
      () => QuestionRepositoryImpl(sl()));

  sl.registerLazySingleton<QuestionRemoteDataSource>(
    () => QuestionRemoteDataSourceImpl(
      Dio(
        BaseOptions(
          baseUrl: 'https://quizapi.io/api/v1/',
          connectTimeout: 1500,
          sendTimeout: 1500,
          receiveTimeout: 1500,
        ),
      ),
    ),
  );
}
