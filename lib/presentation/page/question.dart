import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victory/presentation/state/cubit/question_cubit.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<QuestionCubit, QuestionState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: context.read<QuestionCubit>().test.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text(context.read<QuestionCubit>().test[index].question),
                );
              });
        },
      ),
    );
  }
}
