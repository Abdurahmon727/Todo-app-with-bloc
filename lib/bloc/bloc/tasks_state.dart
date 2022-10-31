part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  List<MyTasks> allTasks;

  TasksState({this.allTasks = const <MyTasks>[]});

  @override
  List<Object> get props => [allTasks];
}

class TasksInitial extends TasksState {}
