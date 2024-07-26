import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simpson_app/core/services/services.dart';
import 'package:simpson_app/features/home/domain/domain.dart';
import 'package:simpson_app/features/home/infrastructure/infrastructure.dart';
import 'package:simpson_app/features/home/presentation/providers/characters/characters_notifier.dart';
import 'package:simpson_app/features/home/presentation/providers/characters/characters_state.dart';

final useCaseProvider = StateProvider<SimpsonUseCases>((ref) {
  return GetSimpsonCharactersUseCase(
      repository: SimpsonRepositoryImpl(
    dataSource: RemoteSimpsonDatasource(
      client: ServiceLocator.sl.get(),
    ),
  ));
});

final charactersProvider =
    StateNotifierProvider<CharactersNotifier, CharactersState>((ref) {
  return CharactersNotifier(getCharactersUseCase: ref.watch(useCaseProvider));
});
