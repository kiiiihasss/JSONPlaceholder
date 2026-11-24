import 'package:flutter/material.dart';
import 'package:jsonplaceholder/pages/tabs/posts_tab.dart';
import 'package:jsonplaceholder/pages/tabs/comments_tab.dart';
import 'package:jsonplaceholder/pages/tabs/albums_tab.dart';
import 'package:jsonplaceholder/pages/tabs/users_tab.dart';
import 'package:jsonplaceholder/pages/tabs/photos_tab.dart';
import 'package:jsonplaceholder/pages/tabs/todos_tab.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  static const _tabs = <_TabItem>[
    _TabItem('Posts', Icons.article_outlined, Icons.article),
    _TabItem('Comments', Icons.comment_outlined, Icons.comment),
    _TabItem('Albums', Icons.album_outlined, Icons.album),
    _TabItem('Users', Icons.people_outline, Icons.people),
    _TabItem('Photos', Icons.photo_outlined, Icons.photo),
    _TabItem('Todos', Icons.checklist_outlined, Icons.checklist),
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        backgroundColor: scheme.surface,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [scheme.primary, scheme.tertiary],
              ),
            ),
          ),
          foregroundColor: scheme.onPrimary,
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.api_rounded, size: 22),
              ),
              const SizedBox(width: 12),
              const Text(
                'JSONPlaceholder',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(64),
            child: Container(
              height: 64,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.symmetric(vertical: 2),
                indicator: BoxDecoration(
                  color: scheme.surface,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                labelColor: scheme.primary,
                unselectedLabelColor: scheme.onPrimary.withOpacity(0.85),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
                labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                splashBorderRadius: BorderRadius.circular(24),
                tabs: _tabs
                    .map(
                      (t) => Tab(
                    height: 44,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(t.icon, size: 18),
                          const SizedBox(width: 6),
                          Text(t.label),
                        ],
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
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

class _TabItem {
  final String label;
  final IconData icon;
  final IconData activeIcon;
  const _TabItem(this.label, this.icon, this.activeIcon);
}