import 'package:music_app/features/album/domain/entities/album/album.dart';

class AlbumModel {
  int userId;
  int id;
  String title;

  AlbumModel({required this.userId, required this.id, required this.title});

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title};
  }
}

extension AlbumModelX on AlbumModel {
  Album toEntity() {
    return Album(userId: userId, id: id, title: title);
  }
}
