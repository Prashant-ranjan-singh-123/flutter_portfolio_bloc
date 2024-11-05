import 'package:flutter/material.dart';
import 'package:prashant_portfolio/state_management/splash/splash_cubit.dart';
import 'screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => SplashCubit(),
        child: const SplashScreen(),
      ),
    );
  }
}
