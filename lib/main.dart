import 'package:flutter/material.dart';
import 'package:stop_watch/ui/view/stop_watch_screen.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch/viewmodel/stop_watch_view_model.dart';

void main() {
  runApp(ChangeNotifierProvider.value(
      value: StopWatchViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stop Watch',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const StopWatchScreen(),
    );
  }
}
