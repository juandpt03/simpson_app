import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'htttp_request_failure.freezed.dart';

@freezed
sealed class HttpRequestFailure with _$HttpRequestFailure {
  const factory HttpRequestFailure.notFound() = _NotFound;
  const factory HttpRequestFailure.badRequest() = _BadRequest;
  const factory HttpRequestFailure.serverError() = _ServerError;
  const factory HttpRequestFailure.unknow() = _Unknow;
  const factory HttpRequestFailure.notInternet() = _NotInternet;
  const factory HttpRequestFailure.unauthorized() = _Unauthorized;

  factory HttpRequestFailure.fromCode(int? code) {
    if (code == null) return const HttpRequestFailure.unknow();
    if (code == 404) return const HttpRequestFailure.notFound();
    if (code == 400) return const HttpRequestFailure.badRequest();
    if (code == 401) return const HttpRequestFailure.unauthorized();
    if (code == 403) return const HttpRequestFailure.unauthorized();
    if (code >= 500) return const HttpRequestFailure.serverError();
    return const HttpRequestFailure.unknow();
  }

  factory HttpRequestFailure.fromException(Object exeption) {
    if (exeption is DioException) {
      if (exeption.type == DioExceptionType.connectionError) {
        return const HttpRequestFailure.notInternet();
      }

      return HttpRequestFailure.fromCode(exeption.response?.statusCode);
    }

    if (exeption is HttpRequestFailure) return exeption;

    return const HttpRequestFailure.unknow();
  }
}
