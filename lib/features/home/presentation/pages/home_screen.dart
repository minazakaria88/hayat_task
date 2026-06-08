import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/error_widget.dart';
import '../cubit/home_cubit.dart';
import '../widgets/task_details_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          context.pushNamed(
            AppRouter.createEditTask.name,
            extra: {'cubit': context.read<HomeCubit>()},
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final tasks = state.tasks ?? [];
          if (state.getTasksStatus == GetTasksStatus.loading ||
              state.getTasksStatus == GetTasksStatus.initial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.getTasksStatus == GetTasksStatus.failure) {
            return Center(
              child: AppErrorWidget(
                error: state.errorMessage ?? '',
                onRetry: () {
                  context.read<HomeCubit>().getTodos();
                },
              ),
            );
          } else {
            if (tasks.isEmpty) {
              return const Center(child: Text('No tasks found'));
            }
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
        },
      ),
    );
  }
}
