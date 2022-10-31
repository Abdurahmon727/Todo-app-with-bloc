// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TasksEvent {
  final MyTasks task;
  const AddTaskEvent({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class UpdateTaskEvent extends TasksEvent {
  final MyTasks task;
  const UpdateTaskEvent({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class DeleteTaskEvent extends TasksEvent {
  final MyTasks task;
  const DeleteTaskEvent({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}
