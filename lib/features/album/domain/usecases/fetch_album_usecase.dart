import 'package:music_app/features/album/domain/entities/album/album_entity.dart';
import 'package:music_app/features/album/domain/repositories/album_repository.dart';

class FetchAlbumsUseCase {
  final AlbumRepository repository;

  FetchAlbumsUseCase(this.repository);

  Future<List<AlbumEntity>> call() {
    return repository.fetchAlbums();
  }
}
