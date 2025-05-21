import 'package:music_app/features/album/domain/entities/album_with_photos/album_with_photos.dart';

abstract class AlbumRepository {
  Future<List<AlbumWithPhoto>> getAlbumwithPhoto();
}
