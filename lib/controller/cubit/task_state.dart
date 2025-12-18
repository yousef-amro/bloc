part of 'task_cubit.dart';

@immutable
sealed class TaskState extends Equatable {
  final List<TaskModel> tasksList;
  const TaskState({required this.tasksList});
  @override
  List<Object?> get props => [tasksList];
}

final class TaskInitial extends TaskState {
  TaskInitial() : super(tasksList: []);
}

final class UpDateTask extends TaskState {
  const UpDateTask({required super.tasksList});
}
