import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simpson_app/core/config/theme/app_theme.dart';
import 'package:simpson_app/core/services/services.dart';
import 'package:simpson_app/features/home/presentation/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().theme,
      home: const HomeScreen(),
    );
  }
}
