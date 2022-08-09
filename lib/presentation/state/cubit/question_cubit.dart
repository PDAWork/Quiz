import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:victory/domain/entities/question_entity.dart';
import 'package:victory/domain/usescases/get_question.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  final GetQuestion getQuestion;

  QuestionCubit(this.getQuestion) : super(QuestionInitial());

  List<QuestionEntity> test = [];

  void init(String category, String difficulty) async {
    test = await getQuestion.getAll(category, difficulty);
    emit(QuestionInitial());
  }
}
