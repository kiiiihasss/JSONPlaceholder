import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jsonplaceholder/model/posts.dart';

class PostWidget extends StatelessWidget {
  final Posts posts;
  const PostWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Text('${posts.id}'),
              Text('${posts.userId}'),
            ],
          ),
          Text(posts.title),
        ],
      ),
    );
  }
}
