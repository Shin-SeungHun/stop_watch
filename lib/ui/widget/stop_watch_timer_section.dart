import 'package:flutter/material.dart';
import 'package:stop_watch/viewmodel/stop_watch_view_model.dart';

class StopWatchTimerSection extends StatelessWidget {
  final StopWatchViewModel viewModel;

  const StopWatchTimerSection({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('${viewModel.seconds}', style: const TextStyle(fontSize: 50)),
        Text(viewModel.hundredths),
      ],
    );
  }
}
