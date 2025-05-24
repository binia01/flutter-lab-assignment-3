import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/features/album/domain/entities/album/album_entity.dart';
import 'package:music_app/features/album/domain/entities/photo/photo_entity.dart';

class AlbumListWidget extends StatelessWidget {
  final List<AlbumEntity> albums;
  final List<PhotoEntity> photos;

  const AlbumListWidget({Key? key, required this.albums, required this.photos})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        final album = albums[index];
        final thumbnail = photos.firstWhere(
          (p) => p.albumId == album.id,
          orElse:
              () => PhotoEntity(
                albumId: album.id,
                id: 0,
                title: '',
                url: '',
                thumbnailUrl: '',
              ),
        );
        return ListTile(
          leading: Image.network(
            thumbnail.thumbnailUrl,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            errorBuilder:
                (context, error, stackTrace) =>
                    Icon(Icons.broken_image, size: 50),
          ),
          title: Text(
            album.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text('Tap for details'),
          onTap: () {
            context.pushNamed(
              'albumDetail',
              extra: {"album": album, "photos": photos},
            );
          },
        );
      },
    );
  }
}
