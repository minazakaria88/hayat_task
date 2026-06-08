import 'package:flutter/material.dart';
import 'package:haya/core/helpers/sizes.dart';
import 'package:haya/core/utils/app_colors.dart';
import 'package:haya/features/home/data/models/task_model.dart';
import 'package:intl/intl.dart';

class TaskDetailsCard extends StatelessWidget {
  const TaskDetailsCard({
    super.key,
    required this.model,
    required this.onEdit,
    required this.onDelete,
  });

  final TaskModel model;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  Color get statusColor {
    switch (model.status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'in_progress':
        return Colors.orange;
      case 'pending':
      default:
        return AppColors.primaryColor;
    }
  }

  String get statusLabel {
    switch (model.status.toLowerCase()) {
      case 'completed':
        return 'Completed';
      case 'in_progress':
        return 'In Progress';
      case 'pending':
      default:
        return 'Pending';
    }
  }

  IconData get statusIcon {
    switch (model.status.toLowerCase()) {
      case 'completed':
        return Icons.check_circle_outline;
      case 'in_progress':
        return Icons.timelapse;
      case 'pending':
      default:
        return Icons.pending_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('MMM d, yyyy · h:mm a')
        .format(model.createdAt.toLocal());

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border(
          left: BorderSide(color: statusColor, width: 4),
          right: BorderSide(color: statusColor, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    model.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryTextColor,
                      height: 1.3,
                    ),
                  ),
                ),
                Sizes.horizontalSpace(AppSpacing.sm),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(statusIcon, size: 14, color: statusColor),
                      const SizedBox(width: 4),
                      Text(
                        statusLabel,
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Sizes.verticalSpace(AppSpacing.lg),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.notes_outlined,
                        size: 16,
                        color: AppColors.secondaryTextColor,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Description',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                  Sizes.verticalSpace(AppSpacing.sm),
                  Text(
                    model.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.primaryTextColor,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            Sizes.verticalSpace(AppSpacing.lg),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                  color: AppColors.secondaryTextColor,
                ),
                Sizes.horizontalSpace(AppSpacing.sm),
                Text(
                  formattedDate,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ],
            ),
            Sizes.verticalSpace(AppSpacing.lg),
            const Divider(height: 1),
            Sizes.verticalSpace(AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit_outlined, size: 18),
                    label: const Text('Edit'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                      side: const BorderSide(color: AppColors.primaryColor),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Sizes.horizontalSpace(AppSpacing.md),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete_outline, size: 18),
                    label: const Text('Delete'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red,
                      side: const BorderSide(color: Colors.red),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
