import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class BaseRepository {
  final baseApiUrl = "https://viacep.com.br/ws";
  final finalUrl = "json/";

  final dioClient = Dio(
    BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
    ),
  );

  @protected
  Future<dynamic> get({String? path, Map<String, dynamic>? query}) async {
    var subPath = "$baseApiUrl/$path/$finalUrl";
    final response = await dioClient.get(subPath, queryParameters: query);
    return response;
  }
}
