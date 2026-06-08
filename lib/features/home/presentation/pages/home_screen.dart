import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/error_widget.dart';
import '../cubit/home_cubit.dart';
import '../widgets/tasks_listview.dart';

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
            return TasksListview(tasks: tasks);
          }
        },
      ),
    );
  }
}

