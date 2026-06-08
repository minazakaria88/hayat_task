import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/app_colors.dart';
import '../cubit/home_cubit.dart';

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
            return Center(child: Text(state.errorMessage ?? ''));
          } else {
            return ListView.separated(
              itemCount: tasks.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index].title),
                  subtitle: Text(tasks[index].description),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      //context.read<HomeCubit>().deleteTask(tasks[index].id);
                    },
                  ),
                  onTap: () {
                    context.pushNamed(
                      AppRouter.createEditTask.name,
                      extra: {
                        'cubit': context.read<HomeCubit>(),
                        'task': tasks[index],
                      },
                    );
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
