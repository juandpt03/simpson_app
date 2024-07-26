import 'package:simpson_app/features/home/domain/domain.dart';

class SimpsonRepositoryImpl implements SimpsonRepository {
  final SimpsonDataSource dataSource;

  SimpsonRepositoryImpl({required this.dataSource});

  @override
  GetSimpsonCharacters getSimpsonCharacters() {
    return dataSource.getSimpsonCharacters();
  }
}
