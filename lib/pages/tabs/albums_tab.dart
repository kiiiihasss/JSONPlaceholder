import 'package:flutter/material.dart';
import 'package:jsonplaceholder/service/api_service.dart';
import 'package:jsonplaceholder/widget/async_data_view.dart';
import 'package:jsonplaceholder/widget/album_widget.dart';

class AlbumsTab extends StatelessWidget {
  const AlbumsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncDataView(
      onFetch: ApiService.fetchAlbums,
      itemBuilder: (context, albums, index) {
        return AlbumWidget(albums: albums);
      },
      title: 'Albums',
    );
  }
}