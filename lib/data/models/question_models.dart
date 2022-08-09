import 'package:victory/domain/entities/question_entity.dart';

class QuestionModels extends QuestionEntity {
  const QuestionModels({
    required String question,
    required List<String> answers,
    required List<String> correctAnswers,
  }) : super(
          answers: answers,
          correctAnswers: correctAnswers,
          question: question,
        );

  factory QuestionModels.fromJson(Map<String, dynamic> json) {
    List<String> answersCode = ['a', 'b', 'c', 'd', 'e', 'f'];
    List<String> answersList = [];
    List<String> correctAnswersList = [];

    answersCode.forEach((element) {
      if (json['answers']['answer_$element'] != null) {
        answersList.add(json['answers']['answer_$element']);
        correctAnswersList
            .add(json['correct_answers']['answer_${element}_correct']);
      }
    });

    return QuestionModels(
      question: json['question'],
      answers: answersList,
      correctAnswers: correctAnswersList,
    );
  }
}
