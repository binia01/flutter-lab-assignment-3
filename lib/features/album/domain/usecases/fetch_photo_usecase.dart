import 'package:music_app/features/album/domain/entities/photo/photo_entity.dart';
import 'package:music_app/features/album/domain/repositories/album_repository.dart';

class FetchPhotosUseCase {
  final AlbumRepository repository;

  FetchPhotosUseCase(this.repository);

  Future<List<PhotoEntity>> call() {
    return repository.fetchPhotos();
  }
}
