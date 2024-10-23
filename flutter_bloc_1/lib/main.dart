import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_1/bloc/counter_bloc.dart';
import 'package:flutter_bloc_1/number_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterState counterState = context.watch<CounterBloc>().state;
    int? number = context.select<CounterBloc, int?>((counterBloc) =>
        (counterBloc.state is CounterValue)
            ? (counterBloc.state as CounterValue).value
            : null);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter BLoC"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return NumberCard(
                      title: "Bloc\nBuilder",
                      number: (state is CounterValue) ? state.value : null);
                },
              ),
              const SizedBox(
                width: 40,
              ),
              NumberCard(
                  title: "Watch",
                  number: (counterState is CounterValue)
                      ? counterState.value
                      : null),
              const SizedBox(
                width: 40,
              ),
              NumberCard(title: "Select", number: number),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CounterBloc>().add(Increment());
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: Colors.green[800],
            ),
            child: const Text(
              "Increment",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
