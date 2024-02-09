import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'calendar_provider.freezed.dart';

@freezed
class CalendarEntry with _$CalendarEntry {
  factory CalendarEntry({
    required String imagePath,
    required String name,
    required int index,
  }) = _CalendarEntry;
}

final calendarEntriesProvider =
    StateNotifierProvider<CalendarEntryListNotifier, List<CalendarEntry>>(
        (ref) {
  return CalendarEntryListNotifier();
});

// StateNotifier that manages a list of CalendarEntry
class CalendarEntryListNotifier extends StateNotifier<List<CalendarEntry>> {
  CalendarEntryListNotifier()
      : super(List.generate(
            30,
            (index) => CalendarEntry(
                  imagePath: '', // Initial imagePath
                  name: '',
                  index: index,
                )));

  void updateImagePath(int index, String newPath) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) state[i].copyWith(imagePath: newPath) else state[i],
    ];
  }

  void updateName(int index, String name) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) state[i].copyWith(name: name) else state[i],
    ];
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
