import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:victory/common/url_page.dart';

class Result extends StatefulWidget {
  final int count;
  const Result({Key? key, required this.count}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(child: Text('10/${widget.count}')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, UrlPage.mainPage, (route) => false);
              },
              child: Text('Начать сначала'))
        ],
      ),
    );
  }
}
