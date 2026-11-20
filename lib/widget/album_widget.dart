import 'package:flutter/material.dart';
import 'package:jsonplaceholder/model/albums.dart';

class AlbumWidget extends StatelessWidget {
  final Albums albums;

  const AlbumWidget({super.key, required this.albums});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(15),
            child: Icon(Icons.album_outlined, size: 45,),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  albums.title.toUpperCase(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: EdgeInsets.all(3),
                      child: Text('Album #${albums.id}', style: TextStyle(fontSize: 12),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.all(3),
                        child: Text('User ID: ${albums.userId}'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}