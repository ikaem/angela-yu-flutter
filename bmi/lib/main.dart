import 'package:bmi/navigation/app_router.dart';
import 'package:bmi/navigation/routes.dart';
import 'package:bmi/theme/color_scheme.dart';
import 'package:bmi/theme/slider_theme.dart';
import 'package:bmi/theme/text_theme.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: customTextTheme,
        colorScheme: customColorScheme,
        sliderTheme: sliderTheme(context),
        scaffoldBackgroundColor: customColorScheme.background,
        appBarTheme: AppBarTheme(
          backgroundColor: customColorScheme.surface,
        ),
      ),
      // home: const HomeScreen(),
      routes: AppRouter.createRoutes(context),
      initialRoute: Routes.home,
    );
  }
}
