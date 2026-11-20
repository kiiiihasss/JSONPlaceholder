import 'package:flutter/material.dart';
import 'package:jsonplaceholder/model/photos.dart';

class PhotoWidget extends StatelessWidget {
  final Photos photos;

  const PhotoWidget({super.key, required this.photos});

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
                Text('ID: ${photos.id}'),
                const Spacer(),
                Text('Album ID: ${photos.albumId}'),
              ],
            ),
            const SizedBox(height: 10),
            Image.network(
              photos.thumbnailUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 150,
                  child: Center(
                    child: Text('Image not available'),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            Text(
              photos.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}