import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksInitial()) {
    on<AddTaskEvent>((event, emit) {
      final state = this.state;
      emit(TasksState(allTasks: List.from(state.allTasks)..add(event.task)));
    });

    on<UpdateTaskEvent>((event, emit) {
      final state = this.state;
      final task = event.task;
      List<MyTasks> allTasks = List.from(state.allTasks)..remove(task);
      task.isDone == false
          ? allTasks.add(task.copyWith(isDone: true))
          : allTasks.add(task.copyWith(isDone: false));

      emit(TasksState(allTasks: allTasks));
    });
    on<DeleteTaskEvent>((event, emit) {});
  }
}
