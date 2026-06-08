import 'package:flutter/material.dart';
import 'package:haya/core/helpers/sizes.dart';
import '../../data/models/profile_model.dart';

class ProfileCard extends StatelessWidget {
  final UserModel user;

  const ProfileCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF6A11CB),
            Color(0xFF2575FC),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Text(
                  user.name.isNotEmpty
                      ? user.name[0].toUpperCase()
                      : user.email[0].toUpperCase(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'ID: ${user.id}',
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              )
            ],
          ),

         Sizes.verticalSpace(10),
          const Divider(color: Colors.white30),

          Sizes.verticalSpace(10),

          Row(
            children: [
              const Icon(Icons.email, color: Colors.white),
              Sizes.horizontalSpace(10),
              Expanded(
                child: Text(
                  user.email,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}