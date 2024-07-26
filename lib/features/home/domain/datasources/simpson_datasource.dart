import 'package:simpson_app/core/utils/utils.dart';
import 'package:simpson_app/features/home/domain/domain.dart';

typedef GetSimpsonCharacters
    = Future<Either<HttpRequestFailure, List<Character>>>;

abstract class SimpsonDataSource {
  GetSimpsonCharacters getSimpsonCharacters();
}
