import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simpson_app/core/utils/utils.dart';
import 'package:simpson_app/features/home/domain/domain.dart';

part 'characters_state.freezed.dart';

@freezed
sealed class CharactersState with _$CharactersState {
  const factory CharactersState.success({required List<Character> characters}) =
      _Success;
  const factory CharactersState.loading() = _Loading;
  const factory CharactersState.error({required HttpRequestFailure error}) =
      _Error;
}
