import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hundredpace/common/theme.dart';
import 'package:hundredpace/models/timer.dart';
import 'package:hundredpace/screens/home.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TimeTracker(),
      child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '100pace',
      theme: appTheme,
      home: const MyHome(),
    );
  }
}