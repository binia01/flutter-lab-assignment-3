import 'package:music_app/core/errors/app_errors.dart';
import 'package:music_app/features/album/data/datasources/album_remote_datasource.dart';
import 'package:music_app/features/album/data/models/album/album_model.dart';
import 'package:music_app/features/album/data/models/photo/photo_model.dart';
// import 'package:music_app/features/album/domain/entities/album_with_photos/album_with_photos.dart';
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
  // @override
  // Future<List<AlbumWithPhoto>> getAlbumwithPhoto() async {
  //   try {
  //     final albumModels = await datasource.fetchAlbums();
  //     final photoModels = await datasource.fetchPhotos();

  //     final combinedList =
  //         albumModels.map((album) {
  //           final matchingPhoto = photoModels.firstWhere(
  //             (photo) => photo.albumId == album.id,
  //             orElse:
  //                 () => PhotoModel(
  //                   albumId: album.id,
  //                   id: 0,
  //                   title: '',
  //                   url: '',
  //                   thumbnailUrl: '',
  //                 ),
  //           );
  //           return AlbumWithPhoto(
  //             albumId: matchingPhoto.albumId,
  //             id: album.id,
  //             title: album.title,
  //             photoId: matchingPhoto.id,
  //             photoTitle: matchingPhoto.title,
  //             url: matchingPhoto.url,
  //             thumbnailUrl: matchingPhoto.thumbnailUrl,
  //           );
  //         }).toList();

  //     return combinedList;
  //   } catch (_) {
  //     throw ServerException();
  //   }
  // }
}
