import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'heart_verses_provider.freezed.dart';

@freezed
class Verses with _$Verses {
  factory Verses({
    @Default([]) List<String> current,
  }) = _Verses;
}

final versusProvider = StateNotifierProvider<VersesNotifier, Verses>(
  (ref) => VersesNotifier(),
);

class VersesNotifier extends StateNotifier<Verses> {
  VersesNotifier() : super(Verses());

  void addVerse(String verse) {
    state = state.copyWith(current: [...state.current, verse]);
  }

  void deleteVerse(String verse) {
    state = state.copyWith(
      current: state.current.where((v) => v != verse).toList(),
    );
  }
}
