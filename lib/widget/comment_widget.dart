import 'package:flutter/material.dart';
import 'package:jsonplaceholder/model/comments.dart';

class CommentWidget extends StatelessWidget {
  final Comments comments;

  const CommentWidget({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  child: Text(
                    comments.name.isNotEmpty
                        ? comments.name[0].toUpperCase()
                        : '#',
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comments.name,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          comments.email,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300],
                  ),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Post ID: ${comments.postId}',
                    style: theme.textTheme.labelSmall!.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 20),
          Text(
            comments.body,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}