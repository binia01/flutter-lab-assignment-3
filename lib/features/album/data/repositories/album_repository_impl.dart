import 'package:music_app/core/errors/app_errors.dart';
import 'package:music_app/features/album/data/datasources/album_remote_datasource.dart';
import 'package:music_app/features/album/data/models/album/album_model.dart';
import 'package:music_app/features/album/data/models/photo/photo_model.dart';
import 'package:music_app/features/album/domain/entities/album/album_entity.dart';
import 'package:music_app/features/album/domain/entities/photo/photo_entity.dart';
import 'package:music_app/features/album/domain/repositories/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumRemoteDataSource datasource;

  AlbumRepositoryImpl({required this.datasource});

  @override
  Future<List<AlbumEntity>> fetchAlbums() async {
    try {
      final models = await datasource.fetchAlbums();
      return models.map((m) => m.toEntity()).toList();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<PhotoEntity>> fetchPhotos() async {
    try {
      final models = await datasource.fetchPhotos();
      return models.map((m) => m.toEntity()).toList();
    } catch (e) {
      throw ServerException();
    }
  }
}
