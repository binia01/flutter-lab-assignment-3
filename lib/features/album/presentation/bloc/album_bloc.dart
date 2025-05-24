import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/features/album/domain/entities/album/album_entity.dart';
import 'package:music_app/features/album/domain/entities/photo/photo_entity.dart';
import 'package:music_app/features/album/domain/usecases/fetch_album_usecase.dart';
import 'package:music_app/features/album/domain/usecases/fetch_photo_usecase.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final FetchAlbumsUseCase fetchAlbums;
  final FetchPhotosUseCase fetchPhotos;

  AlbumBloc({required this.fetchAlbums, required this.fetchPhotos})
    : super(AlbumInitial()) {
    on<FetchAlbumsEvent>((event, emit) async {
      emit(AlbumLoading());
      try {
        final albums = await fetchAlbums();
        final photos = await fetchPhotos();
        emit(AlbumLoaded(albums: albums, photos: photos));
      } catch (e) {
        emit(AlbumError('Failed to fetch albums'));
      }
    });
  }
}
