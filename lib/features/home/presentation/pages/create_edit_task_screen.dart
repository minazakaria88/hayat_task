import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:haya/core/helpers/extensions.dart';
import 'package:haya/core/helpers/sizes.dart';
import 'package:haya/core/widgets/app_button.dart';
import 'package:haya/core/widgets/my_drop_down_menu.dart';
import '../../../../core/widgets/my_text_form_field.dart';
import '../../data/models/task_model.dart';
import '../cubit/home_cubit.dart';

class CreateEditTaskScreen extends StatefulWidget {
  const CreateEditTaskScreen({super.key, this.task});
  final TaskModel? task;
  @override
  State<CreateEditTaskScreen> createState() => _CreateEditTaskScreenState();
}

class _CreateEditTaskScreenState extends State<CreateEditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? taskStatus;

  final taskStatuses = ['pending', 'in_progress', 'completed'];

  bool isEditMode() => widget.task != null;

  void initTask() {
    if (widget.task == null) {
      return;
    }
    _titleController.text = widget.task!.title;
    _descriptionController.text = widget.task!.description;
    taskStatus = widget.task!.status;
  }

  @override
  void initState() {
    initTask();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) =>
          previous.createTaskStatus != current.createTaskStatus,
      listener: (context, state) {
        if (state.createTaskStatus == CreateTaskStatus.success) {
          context.pop();
        }
        if (state.createTaskStatus == CreateTaskStatus.failure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage ?? '')));
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(isEditMode() ? 'Edit Task' : 'Create Task')),
        body: Padding(
          padding: EdgeInsets.all(Sizes.pagePadding),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AppTextFormField(
                  controller: _titleController,
                  hint: 'Title',
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return 'Title is required';
                    }
                    return null;
                  },
                ),
                Sizes.verticalSpace(AppSpacing.lg),
                AppTextFormField(
                  controller: _descriptionController,
                  hint: 'Description',
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return 'Description is required';
                    }
                    return null;
                  },
                ),
                Sizes.verticalSpace(AppSpacing.lg),
                if (isEditMode())
                MyDropDownMenu(
                  width: double.infinity,
                  maxHeight: 56,
                  initialValue: taskStatus,
                  label: 'Task Status',
                  onSelected: (value) {
                    taskStatus = value;
                  },
                  dropdownMenuEntries: taskStatuses
                      .map((e) => DropdownMenuEntry(label: e, value: e))
                      .toList(),
                ),
                Sizes.verticalSpace(AppSpacing.lg),

                _buildCreateEditButton(homeCubit),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocBuilder<HomeCubit, HomeState> _buildCreateEditButton(
    HomeCubit homeCubit,
  ) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.createTaskStatus != current.createTaskStatus,
      builder: (context, state) {
        return state.createTaskStatus == CreateTaskStatus.loading
            ? const Center(child: CircularProgressIndicator())
            : MyButton(
                title: isEditMode() ? 'Update' : 'Create',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    if (isEditMode()) {
                      homeCubit.updateTodo(
                        id: widget.task!.id,
                        title: _titleController.text,
                        description: _descriptionController.text,
                        status: taskStatus!,
                      );
                    } else {
                      homeCubit.createTodo(
                        title: _titleController.text,
                        description: _descriptionController.text,
                      );
                    }
                  }
                },
              );
      },
    );
  }
}
