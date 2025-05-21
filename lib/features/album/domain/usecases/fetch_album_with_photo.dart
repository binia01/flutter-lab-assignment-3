import 'package:music_app/features/album/domain/entities/album_with_photos/album_with_photos.dart';
import 'package:music_app/features/album/domain/repositories/album_repository.dart';

class FetchAlbumsWithPhotosUseCase {
  final AlbumRepository repository;

  FetchAlbumsWithPhotosUseCase(this.repository);

  Future<List<AlbumWithPhoto>> call() async {
    return await repository.getAlbumwithPhoto();
  }
}
