import 'package:flutter/material.dart';
import 'package:hundredpace/models/tracker.dart';
import 'package:provider/provider.dart';

class MyHistory extends StatelessWidget {
  const MyHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<Tracker>(
        builder: (context, tracker, child) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: tracker.tracks.length,
                itemBuilder: (context, index) {
                  var track = tracker.tracks[index];
                  return ListTile(
                    title: Text('Walk number ${index+1}'),
                    subtitle: Text('Duration: ${track.duration.inMinutes}:${track.duration.inSeconds.toString().padLeft(2, '0')}'),
                    trailing: Icon(
                      track.isCompleted ? Icons.check : Icons.close,
                      color: track.isCompleted ? Colors.green : Colors.red
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}