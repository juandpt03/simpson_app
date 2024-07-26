import 'package:simpson_app/features/home/domain/domain.dart';

abstract class SimpsonUseCases {
  GetSimpsonCharacters getSimpsonCharacters();
}

class GetSimpsonCharactersUseCase implements SimpsonUseCases {
  final SimpsonRepository repository;

  GetSimpsonCharactersUseCase({required this.repository});

  @override
  GetSimpsonCharacters getSimpsonCharacters() {
    return repository.getSimpsonCharacters();
  }
}
