import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'calendar_provider.freezed.dart';

@freezed
class CalendarEntry with _$CalendarEntry {
  factory CalendarEntry({
    required String imagePath,
    required int index,
  }) = _CalendarEntry;
}

// Hard-coded list of CalendarEntry items
final calendarEntriesProvider = Provider<List<CalendarEntry>>((ref) {
  return List.generate(
      30,
      (index) => CalendarEntry(
            imagePath: '', // Example path, adjust as needed
            index: index,
          ));
});

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
