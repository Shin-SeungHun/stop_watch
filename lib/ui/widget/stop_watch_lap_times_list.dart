import 'package:flutter/material.dart';
import 'package:stop_watch/viewmodel/stop_watch_view_model.dart';

class StopWatchLapTimesList extends StatelessWidget {
  final StopWatchViewModel viewModel;

  const StopWatchLapTimesList({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 200,
      child: ListView(
        children: viewModel.lapTimes
            .map((time) => Center(child: Text(time)))
            .toList(),
      ),
    );
  }
}
