import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jsonplaceholder/model/posts.dart';

class PostWidget extends StatelessWidget {
  final Posts posts;

  const PostWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.only(left: 8, right: 8, top: 8),
      elevation: 1.5,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '#${posts.id}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text('User ID : ${posts.userId}'),
              ],
            ),
            Text(
              posts.title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              posts.body,
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
