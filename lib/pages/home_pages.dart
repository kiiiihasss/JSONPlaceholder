import 'package:flutter/material.dart';
import 'package:jsonplaceholder/pages/tabs/posts_tab.dart';
import 'package:jsonplaceholder/pages/tabs/comments_tab.dart';
import 'package:jsonplaceholder/pages/tabs/albums_tab.dart';
import 'package:jsonplaceholder/pages/tabs/users_tab.dart';
import 'package:jsonplaceholder/pages/tabs/photos_tab.dart';
import 'package:jsonplaceholder/pages/tabs/todos_tab.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('JSONPlaceholder API'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Posts(100)', icon: Icon(Icons.article_outlined),),
              Tab(text: 'Comments', icon: Icon(Icons.comment_outlined),),
              Tab(text: 'Albums', icon: Icon(Icons.album),),
              Tab(text: 'Users'),
              Tab(text: 'Photos'),
              Tab(text: 'Todos'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PostsTab(),
            CommentsTab(),
            AlbumsTab(),
            UsersTab(),
            PhotosTab(),
            TodosTab(),
          ],
        ),
      ),
    );
  }
}