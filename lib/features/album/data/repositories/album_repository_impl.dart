import 'package:music_app/core/errors/app_errors.dart';
import 'package:music_app/features/album/data/datasources/album_remote_datasource.dart';
import 'package:music_app/features/album/data/models/album/album_model.dart';
import 'package:music_app/features/album/data/models/photo/photo_model.dart';
import 'package:music_app/features/album/domain/repositories/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumRemoteDataSource datasource;

  AlbumRepositoryImpl({required this.datasource});

  @override
  Future<List<AlbumModel>> fetchAlbums() async {
    try {
      return await datasource.fetchAlbums();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<PhotoModel>> fetchPhotos() async {
    try {
      return await datasource.fetchPhotos();
    } catch (e) {
      throw ServerException();
    }
  }
}
