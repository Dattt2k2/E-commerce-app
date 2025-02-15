import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:e_commerce_app/config/routes/router.dart';
import 'package:e_commerce_app/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: buildThemeData(context: context),
      dark: buildThemeData(context: context, isDarkTheme: true),
      initial: AdaptiveThemeMode.light,
      builder: (light, dark) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: light,
        darkTheme: dark,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child ?? const SizedBox(),
          breakpoints: const [
            Breakpoint(start: 0, end: 480, name: MOBILE),
            Breakpoint(start: 481, end: 768, name: TABLET),
            Breakpoint(start: 769, end: double.infinity, name: DESKTOP),
          ],
        ),
      ),
    );
  }
}