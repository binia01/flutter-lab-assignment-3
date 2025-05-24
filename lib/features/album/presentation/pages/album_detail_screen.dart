import 'package:flutter/material.dart';
import 'package:music_app/features/album/domain/entities/album/album_entity.dart';
import 'package:music_app/features/album/domain/entities/photo/photo_entity.dart';
import 'package:music_app/features/album/presentation/widgets/album_detail_widget.dart';

class AlbumDetailScreen extends StatelessWidget {
  final AlbumEntity album;
  final List<PhotoEntity> photos;

  const AlbumDetailScreen({Key? key, required this.album, required this.photos})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Album ${album.id}')),
      body: AlbumDetailWidget(album: album, photos: photos),
    );
  }
}
