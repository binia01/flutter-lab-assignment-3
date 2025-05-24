import 'package:music_app/features/album/domain/entities/album/album_entity.dart';
import 'package:music_app/features/album/domain/entities/photo/photo_entity.dart';

abstract class AlbumRepository {
  Future<List<AlbumEntity>> fetchAlbums();
  Future<List<PhotoEntity>> fetchPhotos();
}
