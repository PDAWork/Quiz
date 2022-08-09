import 'package:equatable/equatable.dart';

class QuestionEntity extends Equatable {
  final String question;
  final List<String?> answers;
  final List<String> correctAnswers;

  const QuestionEntity({
    required this.question,
    required this.answers,
    required this.correctAnswers,
  });

  @override
  List<Object?> get props => [question, answers, correctAnswers];
}
