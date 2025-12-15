import 'package:blocuhiuhuih/controller/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    print("dd");
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(
            context,
          ).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (BuildContext context, state) {
                  print("d11d");
                  return Text(
                    state.count.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (BuildContext context, state) {
                  return FloatingActionButton(
                    onPressed: () {
                      context.read<CounterCubit>().increase();
                    },
                    child: const Icon(Icons.add),
                  );
                },
              ),
              const SizedBox(height: 30),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (BuildContext context, state) {
                  return FloatingActionButton(
                    onPressed: () {
                      context.read<CounterCubit>().decrease();
                    },
                    child: const Icon(Icons.emoji_flags_outlined),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
