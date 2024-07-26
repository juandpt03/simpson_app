import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simpson_app/features/home/domain/usecases/simpson_usecases.dart';
import 'package:simpson_app/features/home/presentation/providers/characters/characters_state.dart';

class CharactersNotifier extends StateNotifier<CharactersState> {
  final SimpsonUseCases getCharactersUseCase;

  CharactersNotifier({
    required this.getCharactersUseCase,
  }) : super(const CharactersState.loading()) {
    getCharacters();
  }

  Future<void> getCharacters() async {
    final response = await getCharactersUseCase.getSimpsonCharacters();

    state = response.when(
      left: (error) => CharactersState.error(error: error),
      right: (characters) => CharactersState.success(characters: characters),
    );
  }
}
