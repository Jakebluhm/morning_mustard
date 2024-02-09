import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:morning_mustard/providers/calendar_entry.dart';
import 'package:shared_preferences/shared_preferences.dart';

final calendarEntriesProvider =
    StateNotifierProvider<CalendarEntryListNotifier, List<CalendarEntry>>(
        (ref) {
  return CalendarEntryListNotifier();
});

class CalendarEntryListNotifier extends StateNotifier<List<CalendarEntry>> {
  CalendarEntryListNotifier() : super([]) {
    _loadFromPrefs();
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? entriesJson = prefs.getString('calendarEntries');
    if (entriesJson != null) {
      final List<dynamic> jsonList = json.decode(entriesJson) as List<dynamic>;
      final entries = jsonList
          .map((json) => CalendarEntry.fromJson(json as Map<String, dynamic>))
          .toList();
      state = entries;
    } else {
      // Initialize with default values if not found in prefs
      state = List.generate(
        30,
        (index) => CalendarEntry(
          imagePath: '', // Initial imagePath
          name: '',
          index: index,
        ),
      );
    }
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String entriesJson =
        json.encode(state.map((entry) => entry.toJson()).toList());
    await prefs.setString('calendarEntries', entriesJson);
  }

  void updateImagePath(int index, String newPath) {
    // Directly update the state without calling super
    state = state.map((entry) {
      if (entry.index == index) {
        return entry.copyWith(imagePath: newPath);
      }
      return entry;
    }).toList();
    _saveToPrefs();
  }

  void updateName(int index, String newName) {
    // Directly update the state without calling super
    state = state.map((entry) {
      if (entry.index == index) {
        return entry.copyWith(name: newName);
      }
      return entry;
    }).toList();
    _saveToPrefs();
  }
}

class ActiveIndexNotifier extends StateNotifier<int> {
  ActiveIndexNotifier()
      : super(0); // Initial state is `null`, indicating no active index

  void setActiveIndex(int index) {
    print('Active index is $index');
    state = index;
  }

  int getActiveIndex() {
    print('Active index is $state');
    return state;
  }
}

// Define a provider for managing the active index
final activeIndexProvider =
    StateNotifierProvider<ActiveIndexNotifier, int?>((ref) {
  return ActiveIndexNotifier();
});
