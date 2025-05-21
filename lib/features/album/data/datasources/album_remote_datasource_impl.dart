import 'dart:convert';
import 'package:music_app/core/constants/app_strings.dart';
import 'package:music_app/core/network/api_request.dart';
import 'package:music_app/features/album/data/datasources/album_remote_datasource.dart';
import 'package:music_app/features/album/data/models/album/album_model.dart';
import 'package:music_app/features/album/data/models/photo/photo_model.dart';

class AlbumRemoteDatasourceImpl implements AlbumRemoteDataSource {
  final ApiService apiService;

  AlbumRemoteDatasourceImpl({required this.apiService});

  @override
  Future<List<AlbumModel>> fetchAlbums() async {
    final response = await apiService.getRequest(
      '${AppConstants.baseApi}albums',
    );
    final List decoded = json.decode(response.body);
    return decoded.map((json) => AlbumModel.fromJson(json)).toList();
  }

  @override
  Future<List<PhotoModel>> fetchPhotos() async {
    final response = await apiService.getRequest(
      '${AppConstants.baseApi}photos',
    );
    final List decoded = json.decode(response.body);
    return decoded.map((json) => PhotoModel.fromJson(json)).toList();
  }
}
