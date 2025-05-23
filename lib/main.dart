import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/network/api_request.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/features/album/data/datasources/album_remote_datasource_impl.dart';
import 'package:music_app/features/album/data/repositories/album_repository_impl.dart';
import 'package:music_app/features/album/presentation/bloc/album_bloc.dart';
import 'package:music_app/routes/go_router.dart';

void main() {
  final apiService = ApiService(http.Client());
  final remoteDataSource = AlbumRemoteDatasourceImpl(apiService: apiService);
  final repository = AlbumRepositoryImpl(datasource: remoteDataSource);
  runApp(
    BlocProvider(
      create: (_) => AlbumBloc(repository: repository),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: appRouter);
  }
}
