import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victory/common/url_page.dart';
import 'package:victory/presentation/state/cubit/question_cubit.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int count = 0;
  int questionSuccess = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<QuestionCubit, QuestionState>(
        builder: (context, state) {
          if (context.read<QuestionCubit>().test.length == 0) {
            return const Center(child: CircularProgressIndicator());
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(context.read<QuestionCubit>().test[count].question),
                Container(
                  width: 300,
                  height: 300,
                  child: ListView.builder(
                    itemCount: context
                        .read<QuestionCubit>()
                        .test[count]
                        .answers
                        .length,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        setState(() {
                          if (context
                                  .read<QuestionCubit>()
                                  .test[count]
                                  .correctAnswers[index] ==
                              "true") {
                            questionSuccess++;
                          }
                          count++;
                        });
                        if (context.read<QuestionCubit>().test.length ==
                            count) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, UrlPage.resultPage, (_) => false,arguments: questionSuccess);
                        }
                      },
                      title: Text(context
                          .read<QuestionCubit>()
                          .test[count]
                          .answers[index]!),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
