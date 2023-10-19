import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'game_provider.freezed.dart';

@freezed
class Game with _$Game {
  factory Game({
    String? uuid,
  }) = _Game;

  factory Game.initial() => Game(
        uuid: null,
      );
}

final gameProvider =
    StateNotifierProvider<GameNotifier, Game>((ref) => GameNotifier());

class GameNotifier extends StateNotifier<Game> {
  GameNotifier() : super(Game.initial());

  void updateGameUuid(String uuid) {
    state = state.copyWith(uuid: uuid);
  }
}
