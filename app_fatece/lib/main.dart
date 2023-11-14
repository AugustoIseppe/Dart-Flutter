import 'package:app_fatece/pages/grades_page.dart';
import 'package:app_fatece/pages/login_page.dart';
import 'package:app_fatece/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'pages/financial_page.dart';
import 'pages/frequency_page.dart';
import 'pages/home_page.dart';
import 'pages/personal_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      routes: {
        AppRoutes.HOME_PAGE:(context) => const HomePage(),
        AppRoutes.GRADES_PAGE:(context) => const GradesPage(),
        AppRoutes.FREQUENCY_PAGE:(context) => const FrequencyPage(),
        AppRoutes.PERSONALDATA_PAGE:(context) => const PersonalData(),
        AppRoutes.FINANCIAL_PAGE:(context) => const FinancialPage(),
      },
    );
  }
}


