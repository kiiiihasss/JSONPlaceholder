import 'package:flutter/material.dart';

class AsyncDataView<T> extends StatefulWidget {
  final Future<List<T>> Function() onFetch;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final String title;

  const AsyncDataView({
    super.key,
    required this.onFetch,
    required this.itemBuilder,
    required this.title,
  });

  @override
  State<AsyncDataView<T>> createState() => _AsyncDataViewState<T>();
}

class _AsyncDataViewState<T> extends State<AsyncDataView<T>> {
  late Future<List<T>> _future;

  @override
  void initState() {
    // TODO: implement initState
    _loadData();
    super.initState();
  }

  void _loadData() {
    _future = widget.onFetch();
  }

  Future<void> _handleRefresh() async {
    setState(() {
      _loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        //1. Loading State
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Column(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text('Memuat ${widget.title}...'),
              ],
            ),
          );
        }
        //2. Error State
        if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Icon(Icons.error),
                SizedBox(height: 12),
                Text('Terjadi kesalahan saat memuat ${widget.title}'),
                SizedBox(height: 12),
                Text('$snapshot.error'),
                ElevatedButton(
                  onPressed: _handleRefresh,
                  child: Text('Refresh Halaman'),
                ),
              ],
            ),
          );
        }
        //3. Empty State
        final items = snapshot.data ?? [];
        if (items.isEmpty) {
          return Center(child: Text('Data is Empty ${widget.title} '));
        }
        //4. Succes State with pull to refresh
        return RefreshIndicator(
          onRefresh: _handleRefresh,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total : ${widget.title} ${items.length}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Tarik ke bawah untuk refresh'),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return widget.itemBuilder(context, items[index], index);
                  },
                  itemCount: items.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
