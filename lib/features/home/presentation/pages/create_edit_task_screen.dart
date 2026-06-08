import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haya/core/helpers/extensions.dart';
import 'package:haya/core/helpers/sizes.dart';
import 'package:haya/core/widgets/app_button.dart';
import '../../../../core/widgets/my_text_form_field.dart';
import '../cubit/home_cubit.dart';

class CreateEditTaskScreen extends StatefulWidget {
  const CreateEditTaskScreen({super.key});

  @override
  State<CreateEditTaskScreen> createState() => _CreateEditTaskScreenState();
}

class _CreateEditTaskScreenState extends State<CreateEditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Create Edit Task')),
      body: Padding(
        padding: EdgeInsets.all(Sizes.pagePadding),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextFormField(
                controller: _titleController,
                hintText: 'Title',
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
                hintText: 'Description',
                validator: (value) {
                  if (value.isNullOrEmpty()) {
                    return 'Description is required';
                  }
                  return null;
                },
              ),
              Sizes.verticalSpace(AppSpacing.lg),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    previous.createTaskStatus != current.createTaskStatus,
                builder: (context, state) {
                  return state.createTaskStatus == CreateTaskStatus.loading
                      ? const Center(child: CircularProgressIndicator())
                      : MyButton(
                          title: 'Create',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              homeCubit.createTodo(
                                title: _titleController.text,
                                description: _descriptionController.text,
                              );
                            }
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
