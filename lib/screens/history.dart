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
                itemCount: tracker.records.length,
                itemBuilder: (context, index) {
                  var record = tracker.records[index];
                  return ListTile(
                    title: Text('Walk number ${index+1}'),
                    subtitle: Text('Duration: ${record.duration.inMinutes}:${record.duration.inSeconds.toString().padLeft(2, '0')}'),
                    trailing: Icon(
                      record.isCompleted ? Icons.check : Icons.close,
                      color: record.isCompleted ? Colors.green : Colors.red
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