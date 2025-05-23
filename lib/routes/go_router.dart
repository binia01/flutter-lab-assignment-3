import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/features/album/data/models/album/album_model.dart';
import 'package:music_app/features/album/data/models/photo/photo_model.dart';
import 'package:music_app/features/album/presentation/pages/album_detail_screen.dart';
import 'package:music_app/features/album/presentation/pages/album_list_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/albums',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/albums',
      name: 'albumList',
      builder: (BuildContext context, GoRouterState state) {
        return AlbumListScreen();
      },
    ),
    GoRoute(
      path: '/detail',
      name: 'albumDetail',
      builder: (BuildContext context, GoRouterState state) {
        final extras = state.extra as Map<String, dynamic>;
        final album = extras['album'] as AlbumModel;
        final photos = extras['photos'] as List<PhotoModel>;
        return AlbumDetailScreen(album: album, photos: photos);
      },
    ),
  ],
);
