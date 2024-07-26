import 'package:dio/dio.dart';
import 'package:simpson_app/core/config/constants/paths/paths.dart';
import 'package:simpson_app/core/utils/utils.dart';

import 'package:simpson_app/features/home/domain/domain.dart';
import 'package:simpson_app/features/home/infrastructure/infrastructure.dart';

class RemoteSimpsonDatasource implements SimpsonDataSource {
  final Dio client;

  RemoteSimpsonDatasource({required this.client});

  @override
  GetSimpsonCharacters getSimpsonCharacters() async {
    try {
      final response = await client.get(
        characterPath,
      );

      if (response.statusCode == 200) {
        final List<Character> characters =
            characterModelFromJson(response.data);

        return Either.right(characters);
      }

      throw HttpRequestFailure.fromCode(response.statusCode);
    } catch (e) {
      final HttpRequestFailure failure = HttpRequestFailure.fromException(e);

      return Either.left(failure);
    }
  }
}
