import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:victory/common/url_page.dart';
import 'package:victory/locator_service.dart';
import 'package:victory/presentation/page/main.dart';
import 'package:victory/presentation/page/question.dart';
import 'package:victory/presentation/page/result.dart';
import 'package:victory/presentation/state/cubit/question_cubit.dart';

class AppRouter {
  Route<dynamic> generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case UrlPage.mainPage:
        {
          return MaterialPageRoute(
            builder: (_) => Main(),
          );
        }
      case UrlPage.questionPage:
        {
          var param = settings.arguments as List;
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) =>
                  sl<QuestionCubit>()..init(param[0], param[1]),
              child: Question(),
            ),
          );
        }
      case UrlPage.resultPage:
        {
          return MaterialPageRoute(builder: (_) => Result());
        }
    }

    return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
