import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  BurdensNotifier() : super(Burdens()) {
    _loadBurdens();
  }

  Future<void> _loadBurdens() async {
    final prefs = await SharedPreferences.getInstance();
    final burdensList = prefs.getStringList('burdens') ?? [];
    state = Burdens(current: burdensList);
  }

  void addBurden(String burden) async {
    final prefs = await SharedPreferences.getInstance();
    final updatedList = [...state.current, burden];
    await prefs.setStringList('burdens', updatedList);
    state = state.copyWith(current: updatedList);
  }

  void deleteBurden(String burden) async {
    final prefs = await SharedPreferences.getInstance();
    final index = state.current.indexOf(burden);
    final updatedList = List.of(state.current); // Create a copy to modify
    if (index != -1) {
      updatedList.removeAt(index); // Removes the first occurrence of `verse`
    }
    await prefs.setStringList('burdens', updatedList);
    state = state.copyWith(current: updatedList);
  }
}
