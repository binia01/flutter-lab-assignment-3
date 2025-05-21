import 'package:flutter/material.dart';
import 'package:music_app/features/album/domain/entities/album_with_photos/album_with_photos.dart';

class AlbumDetailScreen extends StatelessWidget {
  final AlbumWithPhoto album;

  const AlbumDetailScreen({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Album Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                album.url,
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
            Text('Album ID: ${album.id}', style: _headerStyle),
            const SizedBox(height: 8),
            Text('Album Title: ${album.title}', style: _subHeaderStyle),
            const SizedBox(height: 16),
            Text('Photo ID: ${album.photoId}', style: _normalStyle),
            Text('Photo Title: ${album.photoTitle}', style: _normalStyle),
            Text('Photo Album ID: ${album.albumId}', style: _normalStyle),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  TextStyle get _headerStyle =>
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle get _subHeaderStyle =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  TextStyle get _normalStyle => const TextStyle(fontSize: 14);
}
