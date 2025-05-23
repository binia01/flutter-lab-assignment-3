import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/features/album/data/models/album/album_model.dart';
import 'package:music_app/features/album/data/models/photo/photo_model.dart';
import 'package:music_app/features/album/data/repositories/album_repository_impl.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepositoryImpl repository;

  AlbumBloc({required this.repository}) : super(AlbumInitial()) {
    on<FetchAlbumsEvent>((event, emit) async {
      emit(AlbumLoading());
      try {
        final albums = await repository.fetchAlbums();
        final photos = await repository.fetchPhotos();
        emit(AlbumLoaded(albums: albums, photos: photos));
      } catch (e) {
        emit(AlbumError('Failed to fetch albums'));
      }
    });
  }
}
