import 'package:blocuhiuhuih/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocuhiuhuih/controller/cubit/task_cubit.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(
    BlocProvider(create: (_) => TaskCubit(), child: const MyApp()),
  );
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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(
              context,
            ).colorScheme.inversePrimary,
            title: const Text('Flutter Demo Home Page'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Task',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      context.read<TaskCubit>().addTask(
                        controller.text,
                      );
                      controller.clear();
                    }
                  },
                  child: const Text('Add Task'),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.tasksList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(state.tasksList[index].title),
                        leading: Checkbox(
                          value: state.tasksList[index].isCompleted,
                          onChanged: (value) {
                            context.read<TaskCubit>().toggleTask(
                              state.tasksList[index].id,
                            );
                          },
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            context.read<TaskCubit>().removeTask(
                              state.tasksList[index].id,
                            );
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
