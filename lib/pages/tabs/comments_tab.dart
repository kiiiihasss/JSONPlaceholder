import 'package:flutter/material.dart';
import 'package:jsonplaceholder/service/api_service.dart';
import 'package:jsonplaceholder/widget/async_data_view.dart';
import 'package:jsonplaceholder/widget/comment_widget.dart';

class CommentsTab extends StatelessWidget {
  const CommentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncDataView(
      onFetch: ApiService.fetchComments,
      itemBuilder: (context, comments, index) {
        return CommentWidget(comments: comments);
      },
      title: 'Comments',
    );
  }
}