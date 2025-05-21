import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/features/album/domain/entities/album_with_photos/album_with_photos.dart';
import 'package:music_app/features/album/presentation/pages/album_detail_screen.dart';
import 'package:music_app/features/album/presentation/pages/album_list_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: 'albumList',
      builder: (BuildContext context, GoRouterState state) {
        return AlbumListScreen();
      },
    ),
    GoRoute(
      path: '/detail',
      name: 'albumDetail',
      builder: (BuildContext context, GoRouterState state) {
        final album = state.extra as AlbumWithPhoto;
        return AlbumDetailScreen(album: album);
      },
    ),
  ],
);
