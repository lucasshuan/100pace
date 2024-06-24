import 'package:flutter/material.dart';
import 'package:hundredpace/models/timer.dart';
import 'package:provider/provider.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('100pace'),
      ),
      body: Center(
        child: _MyTimer(),
      ),
    );
  }
}

class _MyTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Consumer<TimeTracker>(
          builder: (context, timer, child) => Text(
            timer.formatMMSS,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            var timer = context.read<TimeTracker>();
            timer.start(10);
          },
          child: const Text('START')
        )
      ],
    );
  }
}