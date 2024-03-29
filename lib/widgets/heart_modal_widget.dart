import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morning_mustard/constants/app_info_text.dart';
import 'package:morning_mustard/providers/game/heart_verses_provider.dart';

class HeartModal extends HookConsumerWidget {
  final Function onRemove;

  // Constructor to initialize the infoText
  HeartModal({Key? key, required this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verses = ref.watch(versusProvider);
    final VersesNotifier = ref.watch(versusProvider.notifier);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: screenWidth,
            height: screenHeight * 0.6, // Adjust this to your desired height
            padding: EdgeInsets.only(right: 20, left: 20, top: 50, bottom: 20),
            child: ListView.separated(
              itemCount: verses.current.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        verses.current[index],
                        style: TextStyle(
                          fontFamily: 'PlaypenSans',
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            print('delete verse');
                            onRemove(verses.current[index]);
                          },
                          icon: Icon(Icons.delete_forever))
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(); // Customize this divider as needed
              },
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop(); // Close the modal
              },
            ),
          ),
        ],
      ),
    );
  }
}
