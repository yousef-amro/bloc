import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocuhiuhuih/models/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  void addTask(String title) {
    final model = TaskModel(
      id: const Uuid().v4(),
      title: title,
      isCompleted: false,
    );
    emit(UpDateTask(tasksList: [...state.tasksList, model]));
  }

  void removeTask(String id) {
    final updatedList = state.tasksList
        .where((task) => task.id != id)
        .toList();
    emit(UpDateTask(tasksList: updatedList));
  }

  void toggleTask(String id) {
    final List<TaskModel> newList = state.tasksList.map((task) {
      return task.id == id
          ? task.copyWith(isCompleted: !task.isCompleted)
          : task;
    }).toList();

    emit(UpDateTask(tasksList: newList));
  }
}
