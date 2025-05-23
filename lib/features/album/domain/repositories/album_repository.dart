import 'package:music_app/features/album/data/models/album/album_model.dart';
import 'package:music_app/features/album/data/models/photo/photo_model.dart';

abstract class AlbumRepository {
  Future<List<AlbumModel>> fetchAlbums();
  Future<List<PhotoModel>> fetchPhotos();
}
