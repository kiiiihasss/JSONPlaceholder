import 'package:flutter/material.dart';
import 'package:jsonplaceholder/service/api_service.dart';
import 'package:jsonplaceholder/widget/async_data_view.dart';
import 'package:jsonplaceholder/widget/photo_widget.dart';

class PhotosTab extends StatelessWidget {
  const PhotosTab({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncDataView(
      onFetch: ApiService.fetchPhotos,
      itemBuilder: (context, photos, index) {
        return PhotoWidget(photos: photos);
      },
      title: 'Photos',
    );
  }
}