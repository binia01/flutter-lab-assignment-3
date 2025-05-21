import 'package:music_app/core/errors/app_errors.dart';
import 'package:music_app/features/album/data/datasources/album_remote_datasource.dart';
import 'package:music_app/features/album/data/models/photo/photo_model.dart';
import 'package:music_app/features/album/domain/entities/album_with_photos/album_with_photos.dart';
import 'package:music_app/features/album/domain/repositories/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumRemoteDataSource datasource;

  AlbumRepositoryImpl({required this.datasource});
  @override
  Future<List<AlbumWithPhoto>> getAlbumwithPhoto() async {
    try {
      final albumModels = await datasource.fetchAlbums();
      final photoModels = await datasource.fetchPhotos();

      final combinedList =
          albumModels.map((album) {
            final matchingPhoto = photoModels.firstWhere(
              (photo) => photo.albumId == album.id,
              orElse:
                  () => PhotoModel(
                    albumId: album.id,
                    id: 0,
                    title: '',
                    url: '',
                    thumbnailUrl: '',
                  ),
            );
            return AlbumWithPhoto(
              id: album.id,
              title: album.title,
              thumbnailUrl: matchingPhoto.thumbnailUrl,
            );
          }).toList();

      return combinedList;
    } catch (_) {
      throw ServerException();
    }
  }
}
