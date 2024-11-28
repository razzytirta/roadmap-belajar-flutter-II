import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Elevated Button"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.yellow,
                  surfaceTintColor: Colors.red,
                  shadowColor: Colors.green,
                  minimumSize: const Size(200, 40),
                  alignment: Alignment.centerRight,
                  animationDuration: const Duration(milliseconds: 200),
                  elevation: 2,
                  shape: const StadiumBorder(),
                  side: BorderSide(color: Colors.red.shade900, width: 2),
                  // padding: const EdgeInsets.all(20),
                  // visualDensity: VisualDensity.compact,
                ),
                child: const Text("Elevated Button 1"),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.ac_unit),
                label: const Text("Elevated Button 2"),
                style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(Colors.yellow),
                    backgroundColor: WidgetStateProperty.resolveWith((states) =>
                        states.any((element) => element == WidgetState.pressed)
                            ? Colors.purple
                            : states.any((element) =>
                                    element == WidgetState.disabled)
                                ? Colors.grey
                                : Colors.red),
                    overlayColor:
                        WidgetStateProperty.all(Colors.green.withOpacity(0.5))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
