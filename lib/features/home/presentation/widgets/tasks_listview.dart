import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:haya/features/home/presentation/widgets/task_details_card.dart';
import '../../../../core/routing/app_router.dart';
import '../../data/models/task_model.dart';
import '../cubit/home_cubit.dart';

class TasksListview extends StatelessWidget {
  const TasksListview({super.key, required this.tasks});

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) =>
          previous.deleteTaskStatus != current.deleteTaskStatus,
      listener: (context, state) {
        if (state.deleteTaskStatus == DeleteTaskStatus.failure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage ?? '')));
        }
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return BlocSelector<HomeCubit, HomeState, bool>(
            selector: (state) {
              return state.deletedTaskId == task.id &&
                  state.deleteTaskStatus == DeleteTaskStatus.loading;
            },
            builder: (context, state) => Stack(
              children: [
                TaskDetailsCard(
                  model: task,
                  onEdit: () {
                    context.pushNamed(
                      AppRouter.createEditTask.name,
                      extra: {'cubit': homeCubit, 'task': task},
                    );
                  },
                  onDelete: () async {
                    homeCubit.deleteTodo(id: task.id);
                  },
                ),
                if (state)
                  Positioned.fill(
                    child: Container(
                      color: Colors.grey.withValues(alpha: 0.5),
                      width: double.infinity,
                      height: double.infinity,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
