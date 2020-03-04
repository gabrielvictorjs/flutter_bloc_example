import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/post.dart';

class PostRepository {
  final Dio _client;

  PostRepository(this._client);

  Future<Either<String, List<Post>>> fetchAll() async {
    try {
      final response = await _client.get("/posts");
      final posts =
          (response.data as List).map((item) => Post.fromMap(item)).toList();
      return Right(posts);
    } on DioError catch (e) {
      return Left(e.message);
    }
  }
}
