import 'package:flutter/material.dart';

import '../../../../core/widgets/shimmer_item.dart';

class TasksLoadingWidget extends StatelessWidget {
  const TasksLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ShimmerItem(
          width: double.infinity,
          height: 100,
          margin: 10,
        );
      },
    );
  }
}
