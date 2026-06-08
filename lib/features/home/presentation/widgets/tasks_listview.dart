import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:haya/features/home/presentation/widgets/task_details_card.dart';

import '../../../../core/routing/app_router.dart';
import '../../data/models/task_model.dart';
import '../cubit/home_cubit.dart';

class TasksListview extends StatelessWidget {
  const TasksListview({
    super.key,
    required this.tasks,
  });

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskDetailsCard(
          model: task,
          onEdit: () {
            context.pushNamed(
              AppRouter.createEditTask.name,
              extra: {'cubit': context.read<HomeCubit>(), 'task': task},
            );
          },
          onDelete: () async {
            final confirmed = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Delete Task'),
                content: Text(
                  'Are you sure you want to delete "${task.title}"?',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                    child: const Text('Delete'),
                  ),
                ],
              ),
            );

            if (confirmed != true || !context.mounted) return;

            final success = await context.read<HomeCubit>().deleteTodo(
              id: task.id,
            );

            if (!context.mounted) return;

            if (!success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to delete task')),
              );
            }
          },
        );
      },
    );
  }
}
