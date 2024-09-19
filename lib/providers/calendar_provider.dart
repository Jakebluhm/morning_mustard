import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:morning_mustard/providers/calendar_entry.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

final calendarEntriesProvider =
    StateNotifierProvider<CalendarEntryListNotifier, List<CalendarEntry>>(
        (ref) {
  return CalendarEntryListNotifier();
});

class CalendarEntryListNotifier extends StateNotifier<List<CalendarEntry>> {
  CalendarEntryListNotifier() : super([]) {
    _initialize();
  }

  Future<void> _initialize() async {
    await _loadFromPrefs();
    // Any other initialization logic can go here
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
      state = List.generate(
        30,
        (index) => CalendarEntry(
          imagePath: '',
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

  Future<void> updateImagePath(int index, String newPath) async {
    print("Setting new path: " + newPath);
    state = state.map((entry) {
      if (entry.index == index) {
        if (newPath.startsWith("lib/assets") || newPath.startsWith("assets")) {
          return entry.copyWith(imagePath: newPath);
        }
        // Only save the file name, not the full path for user images
        return entry.copyWith(imagePath: newPath.split('/').last);
      }
      return entry;
    }).toList();
    await _saveToPrefs();
  }

  Future<void> updateName(int index, String newName) async {
    // Directly update the state without calling super
    state = state.map((entry) {
      if (entry.index == index) {
        return entry.copyWith(name: newName);
      }
      return entry;
    }).toList();
    await _saveToPrefs();
  }

  Future<void> pickImage(int index) async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        var status = await Permission.storage.status;
        if (!status.isGranted) {
          await Permission.storage.request();
        }
      } else {
        var status = await Permission.storage.status;
        if (!status.isGranted) {
          await Permission.photos.request();
        }
      }
    } else {
      var status = await Permission.storage.isGranted;
    }

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName =
          DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';
      final savedImage =
          await File(pickedFile.path).copy('${appDir.path}/$fileName');
      await updateImagePath(index, fileName); // Only save the file name
    }
  }
}

class ActiveIndexNotifier extends StateNotifier<int> {
  ActiveIndexNotifier()
      : super(-1); // Initial state is `null`, indicating no active index

  void setActiveIndex(int index) {
    state = index;
  }

  int getActiveIndex() {
    return state;
  }
}

// Define a provider for managing the active index
final activeIndexProvider =
    StateNotifierProvider<ActiveIndexNotifier, int?>((ref) {
  return ActiveIndexNotifier();
});
