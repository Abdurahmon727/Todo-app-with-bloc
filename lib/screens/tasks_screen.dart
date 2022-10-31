import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/model/task.dart';

import '../bloc/bloc_exports.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        var tasks = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                onPressed: () => showBottomSheet(context),
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    'Tasks:${state.allTasks.length}',
                  ),
                ),
              ),
              TasksList(tasks: tasks),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => showBottomSheet(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  final List<MyTasks> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: ((context, index) => ListTile(
              trailing: Checkbox(
                value: tasks[index].isDone,
                onChanged: (newValue) {
                  context
                      .read<TasksBloc>()
                      .add(UpdateTaskEvent(task: tasks[index]));
                },
              ),
              title: Text(tasks[index].title),
            )),
      ),
    );
  }
}

void showBottomSheet(BuildContext context) {
  TextEditingController titleController = TextEditingController();
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(titleController: titleController);
      });
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({
    Key? key,
    required this.titleController,
  }) : super(key: key);

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Text(
              'Add Task',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            TextField(
                controller: titleController,
                autofocus: true,
                decoration: const InputDecoration(
                  label: Text('Title'),
                  border: OutlineInputBorder(),
                )),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () {
                      BlocProvider.of<TasksBloc>(context).add(AddTaskEvent(
                          task: MyTasks(
                              title: titleController.text,
                              whenCreated: DateTime.now().toString())));
                      Navigator.pop(context);
                    },
                    child: const Text('Add'))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
