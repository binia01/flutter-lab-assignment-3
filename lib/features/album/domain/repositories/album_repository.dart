import 'package:music_app/features/album/data/models/album/album_model.dart';
import 'package:music_app/features/album/data/models/photo/photo_model.dart';
// import 'package:music_app/features/album/domain/entities/album_with_photos/album_with_photos.dart';

abstract class AlbumRepository {
  // Future<List<AlbumWithPhoto>> getAlbumwithPhoto();
  Future<List<AlbumModel>> fetchAlbums();
  Future<List<PhotoModel>> fetchPhotos();
}
