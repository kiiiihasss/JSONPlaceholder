import 'package:flutter/material.dart';
import 'package:jsonplaceholder/model/users.dart';

class UserWidget extends StatelessWidget {
  final Users users;

  const UserWidget({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Text('${users.id}'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    users.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text('Username: ${users.username}'),
            Text('Email: ${users.email}'),
            Text('Phone: ${users.phone}'),
            Text('Website: ${users.website}'),
            Text('Address: ${users.address.city}'),
            Text('Company: ${users.company.name}'),
          ],
        ),
      ),
    );
  }
}