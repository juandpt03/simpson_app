import 'package:dio/dio.dart';
import 'package:simpson_app/core/config/constants/paths/paths.dart';

class ConfigClient {
  get client => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          contentType: Headers.jsonContentType,
        ),
      );
}
