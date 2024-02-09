import 'package:freezed_annotation/freezed_annotation.dart';
part 'calendar_entry.freezed.dart';
part 'calendar_entry.g.dart';

@freezed
class CalendarEntry with _$CalendarEntry {
  factory CalendarEntry({
    required String imagePath,
    required String name,
    required int index,
  }) = _CalendarEntry;

  factory CalendarEntry.fromJson(Map<String, dynamic> json) =>
      _$CalendarEntryFromJson(json); // Add this line
}
