import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/features/album/domain/entities/album_with_photos/album_with_photos.dart';
import 'package:music_app/features/album/domain/usecases/fetch_album_with_photo.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final FetchAlbumsWithPhotosUseCase fetchAlbumsWithPhotosUseCase;

  AlbumBloc({required this.fetchAlbumsWithPhotosUseCase})
    : super(AlbumInitial()) {
    on<FetchAlbumsEvent>((event, emit) async {
      emit(AlbumLoading());
      try {
        final albums = await fetchAlbumsWithPhotosUseCase();
        emit(AlbumLoaded(albums));
      } catch (e) {
        emit(AlbumError('Failed to fetch albums'));
      }
    });
  }
}
