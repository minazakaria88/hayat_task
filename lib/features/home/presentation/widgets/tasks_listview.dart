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
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) => Stack(
            children: [
              TaskDetailsCard(
                model: task,
                onEdit: () {
                  context.pushNamed(
                    AppRouter.createEditTask.name,
                    extra: {'cubit': context.read<HomeCubit>(), 'task': task},
                  );
                },
                onDelete: () async {
                  context.read<HomeCubit>().deleteTodo(id: task.id);
                },
              ),
              if (state.deleteTaskStatus == DeleteTaskStatus.loading)
                Positioned.fill(
                  child: Container(
                    color: Colors.grey.shade50,
                    width: double.infinity,
                    height: double.infinity,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
