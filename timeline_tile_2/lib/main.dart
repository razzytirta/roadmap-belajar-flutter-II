import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time Line Tile Demo"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(
            width: 100,
            height: 50,
            child: TimelineTile(
              // axis: TimelineAxis.horizontal,
              // alignment: TimelineAlign.center,
              // alignment: TimelineAlign.end,
              // startChild: const Text("Start"),
              endChild: const Text("First"),
              beforeLineStyle: const LineStyle(color: Colors.red, thickness: 6),
              afterLineStyle: const LineStyle(color: Colors.blue, thickness: 6),
              alignment: TimelineAlign.manual,
              lineXY: 0,
              isFirst: true,
              // isLast: true,
            ),
          ),
          const SizedBox(
            width: 100,
            child: TimelineDivider(
              thickness: 6,
              color: Colors.green,
              begin: 0.12,
              end: 0.88,
            ),
          ),
          SizedBox(
            width: 100,
            height: 50,
            child: TimelineTile(
              // axis: TimelineAxis.horizontal,
              // alignment: TimelineAlign.center,
              // alignment: TimelineAlign.end,
              // startChild: const Text("Start"),
              endChild: const Text("Mid"),
              beforeLineStyle: const LineStyle(color: Colors.red, thickness: 6),
              afterLineStyle: const LineStyle(color: Colors.blue, thickness: 6),
              alignment: TimelineAlign.manual,
              lineXY: 1,
              // isLast: true,
            ),
          ),
          const SizedBox(
            width: 100,
            child: TimelineDivider(
              thickness: 6,
              color: Colors.green,
              begin: 0.12,
              end: 0.88,
            ),
          ),
          SizedBox(
            width: 100,
            height: 50,
            child: TimelineTile(
              // axis: TimelineAxis.horizontal,
              // alignment: TimelineAlign.center,
              // alignment: TimelineAlign.end,
              // startChild: const Text("Start"),
              endChild: const Text("Last"),
              beforeLineStyle: const LineStyle(color: Colors.red, thickness: 6),
              afterLineStyle: const LineStyle(color: Colors.blue, thickness: 6),
              alignment: TimelineAlign.manual,
              lineXY: 0,
              isLast: true,
              // isLast: true,
            ),
          ),
        ],
      ),
    );
  }
}
