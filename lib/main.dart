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
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo.shade600,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo.shade600,
          foregroundColor: Colors.white,
          elevation: 2,
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        listTileTheme: ListTileThemeData(
          iconColor: Colors.indigo,
          textColor: Colors.black87,
        ),
        iconTheme: const IconThemeData(color: Colors.indigo),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
