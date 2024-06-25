import 'package:flutter/material.dart';
import 'package:hundredpace/screens/history.dart';
import 'package:hundredpace/screens/home.dart';
import 'package:hundredpace/screens/tracker.dart';
import 'package:provider/provider.dart';
import 'package:hundredpace/common/theme.dart';
import 'package:hundredpace/models/tracker.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Tracker(),
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '100PACE',
      debugShowCheckedModeBanner: false,
      theme: theme(Brightness.light),
      darkTheme: theme(Brightness.dark),
      themeMode: ThemeMode.system,
      home: const DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                  icon: Icon(Icons.home),
                  text: 'Home'
              ),
              Tab(
                  icon: Icon(Icons.play_arrow),
                  text: 'Tracker'
              ),
              Tab(
                  icon: Icon(Icons.history),
                  text: 'History'
              ),
            ],
          ),
          body: TabBarView(
              children: [
                MyHome(),
                MyTracker(),
                MyHistory(),
              ]
          ),
        ),
      ),
    );
  }
}