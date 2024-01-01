import 'package:flutter/material.dart';
import 'package:stop_watch/viewmodel/stop_watch_view_model.dart';

class StopWatchControlButtons extends StatelessWidget {
  final StopWatchViewModel viewModel;

  const StopWatchControlButtons({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        ),
      ],
    );
  }
}
