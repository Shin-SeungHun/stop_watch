import 'package:flutter/material.dart';
import 'package:stop_watch/ui/widget/stop_watch_control_buttons.dart';
import 'package:stop_watch/ui/widget/stop_watch_lap_times_list.dart';
import 'package:stop_watch/ui/widget/stop_watch_timer_section.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch/viewmodel/stop_watch_view_model.dart';

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
            StopWatchTimerSection(viewModel: viewModel),
            StopWatchLapTimesList(viewModel: viewModel),
            const Spacer(),
            StopWatchControlButtons(viewModel: viewModel),
            const SizedBox(height: 30),
          ],
        ));
  }
}
