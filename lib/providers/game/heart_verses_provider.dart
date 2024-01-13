import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  VersesNotifier() : super(Verses()) {
    _loadVerses();
  }

  Future<void> _loadVerses() async {
    final prefs = await SharedPreferences.getInstance();
    final versesList = prefs.getStringList('verses') ?? [];
    state = Verses(current: versesList);
  }

  void addVerse(String verse) async {
    final prefs = await SharedPreferences.getInstance();
    final updatedList = [...state.current, verse];
    await prefs.setStringList('verses', updatedList);
    state = state.copyWith(current: updatedList);
  }

  void deleteVerse(String verse) async {
    final prefs = await SharedPreferences.getInstance();
    final updatedList = state.current.where((v) => v != verse).toList();
    await prefs.setStringList('verses', updatedList);
    state = state.copyWith(current: updatedList);
  }
}
