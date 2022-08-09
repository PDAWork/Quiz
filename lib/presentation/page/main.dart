import 'package:flutter/material.dart';
import 'package:victory/common/url_page.dart';
import 'package:victory/domain/entities/question_entity.dart';
import 'package:victory/domain/usescases/get_question.dart';
import 'package:victory/locator_service.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  String _selectCategory = 'Easy';
  String _selectDifficulty = 'Linux';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton(
                value: _selectCategory,
                items: <String>['Easy', 'Medium', 'Hard'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {
                  setState(() {
                    _selectCategory = _.toString();
                  });
                },
              ),
              DropdownButton(
                value: _selectDifficulty,
                items: <String>[
                  'Linux',
                  'DevOps',
                  'Networking',
                  'Programming',
                  'Cloud',
                  'Docker',
                  'Kubernetes'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {
                  setState(() {
                    _selectDifficulty = _.toString();
                  });
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    Navigator.pushNamed(
                      context,
                      UrlPage.questionPage,
                      arguments: [_selectCategory, _selectDifficulty],
                    );
                  },
                  child: const Text('Начать игру'))
            ]),
      ),
    );
  }
}
