import 'package:flutter/material.dart';
import 'package:haya/features/home/data/models/task_model.dart';

class TaskDetailsCard extends StatelessWidget {
  const TaskDetailsCard({
    super.key,
    required this.model,
  });

  final TaskModel model;

  Color get statusColor {
    switch (model.status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'in_progress':
        return Colors.orange;
      case 'pending':
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              model.description,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 24),
            Row(
              children: [
                const Icon(Icons.flag_outlined),
                const SizedBox(width: 8),
                const Text(
                  'Status:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    model.status.toUpperCase(),
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.calendar_today_outlined),
                const SizedBox(width: 8),
                const Text(
                  'Created:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Text(
                  model.createdAt.toLocal().toString().split('.').first,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}