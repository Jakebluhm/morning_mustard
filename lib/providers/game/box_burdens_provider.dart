import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'box_burdens_provider.freezed.dart';

@freezed
class Burdens with _$Burdens {
  factory Burdens({
    @Default([]) List<String> current,
  }) = _Burdens;
}

final burdensProvider = StateNotifierProvider<BurdensNotifier, Burdens>(
  (ref) => BurdensNotifier(),
);

class BurdensNotifier extends StateNotifier<Burdens> {
  BurdensNotifier() : super(Burdens());

  void addBurden(String burden) {
    state = state.copyWith(current: [...state.current, burden]);
  }

  void deleteBurden(String burden) {
    state = state.copyWith(
      current: state.current.where((v) => v != burden).toList(),
    );
  }
}
