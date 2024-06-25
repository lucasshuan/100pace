import 'package:flutter/material.dart';
import 'package:hundredpace/models/tracker.dart';
import 'package:provider/provider.dart';

class MyTracker extends StatelessWidget {
  const MyTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _MyTimer(),
    );
  }
}

class _MyTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Consumer<Tracker>(
          builder: (context, tracker, child) => Text(
            tracker.formatMMSS,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            var tracker = context.read<Tracker>();
            if (tracker.isRunning) {
              tracker.stop();
            } else {
              tracker.start(10);
            }
          },
          child: Consumer<Tracker>(
            builder: (context, tracker, child) => Text(
              tracker.isRunning ? 'STOP' : 'START',
            ),
          ),
        )
      ],
    );
  }
}