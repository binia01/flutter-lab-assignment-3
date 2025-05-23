import 'package:flutter/material.dart';
import 'package:music_app/features/album/data/models/album/album_model.dart';
import 'package:music_app/features/album/data/models/photo/photo_model.dart';

class AlbumDetailScreen extends StatelessWidget {
  final AlbumModel album;
  final List<PhotoModel> photos;

  const AlbumDetailScreen({Key? key, required this.album, required this.photos})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final albumPhotos =
        photos.where((photo) => photo.albumId == album.id).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Album ${album.id}')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Center(
            child: Image.network(
              albumPhotos.isNotEmpty ? albumPhotos[0].thumbnailUrl : '',
              height: 200,
              width: 200,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.broken_image, size: 200),
                      Text("Image could not be loaded"),
                    ],
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text('Album ID: ${album.id}', style: _headerStyle),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Album Title: ${album.title}', style: _subHeaderStyle),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Songs:', style: _headerStyle),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 16.0),
                itemCount: albumPhotos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75, // Adjust to fit image+text
                ),
                itemBuilder: (context, index) {
                  final photo = albumPhotos[index];
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          photo.thumbnailUrl,
                          fit: BoxFit.cover,
                          height: 80,
                          width: 80,
                          errorBuilder:
                              (_, __, ___) => Icon(
                                Icons.broken_image,
                                size: 48,
                                color: Colors.grey,
                              ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        photo.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle get _headerStyle =>
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  TextStyle get _subHeaderStyle =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
}
