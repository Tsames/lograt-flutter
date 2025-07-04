import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lograt/presentation/screens/home/home.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: const LogRatApp()));
}

class LogRatApp extends StatelessWidget {
  const LogRatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Lograt', home: Home());
  }
}
