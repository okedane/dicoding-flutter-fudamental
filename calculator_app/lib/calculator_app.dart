
import 'package:calculator_app/provider/match_provider.dart';
import 'package:calculator_app/screen/home/home_screen.dart';
import 'package:calculator_app/service/match_expression.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => MathExpression()),
        ChangeNotifierProvider(
          create: (context) => MathProvider(context.read<MathExpression>()),
        ),
      ],
      child: const CalculatorAppView(),
    );
  }
}

class CalculatorAppView extends StatelessWidget {
  const CalculatorAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
