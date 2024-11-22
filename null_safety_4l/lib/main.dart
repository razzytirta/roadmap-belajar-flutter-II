import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController controller = TextEditingController();
  MyNumber myNumber = MyNumber(number: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Null Safety"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  hintText: 'Insert a number', labelText: 'Number'),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    myNumber.number = int.tryParse(controller.text) ?? 0;
                  });
                },
                child: const Text('CALCULATE'),
              ),
            ),
            Text('RESULT: ${myNumber.multiplyByTwo()}'),
          ],
        ),
      ),
    );
  }
}

class MyNumber {
  int number;

  MyNumber({required this.number});

  int multiplyByTwo() => number * 3;
}
