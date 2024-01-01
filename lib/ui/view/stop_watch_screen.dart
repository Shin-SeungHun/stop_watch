import 'package:flutter/material.dart';

import '../../viewmodel/stop_watch_view_model.dart';
import 'package:provider/provider.dart';

class StopWatchScreen extends StatelessWidget {
  const StopWatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StopWatchViewModel viewModel = context.watch();

    return Scaffold(
      appBar: AppBar(
        title: const Text('스톱워치'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${viewModel.seconds}',
                  style: const TextStyle(fontSize: 50)),
              Text(viewModel.hundredths),
            ],
          ),
          SizedBox(
            width: 100,
            height: 200,
            child: ListView(
              children: viewModel.lapTimes
                  .map((time) => Center(child: Text(time)))
                  .toList(),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.orange,
                onPressed: () {
                  viewModel.reset();
                },
                child: const Icon(Icons.refresh),
              ),
              FloatingActionButton(
                onPressed: () {
                  viewModel.clickBUtton();
                },
                child: viewModel.isRunning
                    ? const Icon(Icons.pause)
                    : const Icon(Icons.play_arrow),
              ),
              FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  viewModel.recordLapTime();
                },
                child: const Icon(Icons.add),
              )
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
