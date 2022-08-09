import 'package:flutter/material.dart';
import 'package:victory/common/url_page.dart';
import 'package:victory/core/platform/routing.dart';
import 'package:victory/locator_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: appRouter.generateRouter,
      initialRoute: UrlPage.mainPage,
    );
  }
}
