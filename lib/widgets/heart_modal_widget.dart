import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final versesNotifier = ref.watch(versusProvider.notifier);
    final textController = useTextEditingController();

    final FocusNode _focusNode = useFocusNode();

    void _showKeyboard() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(_focusNode);
      });
    }

    final isEditing = useState(-1);
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
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        isEditing.value == index
                            ? Container(
                                child: TextField(
                                  controller: textController,
                                  focusNode: _focusNode,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 5,
                                  minLines: 1,
                                  onSubmitted: (newText) {
                                    if (newText.isEmpty) {
                                      versesNotifier
                                          .deleteVerse(verses.current[index]);

                                      isEditing.value = -1;
                                      return;
                                    }

                                    versesNotifier.editVerse(
                                        verses.current[index], newText);
                                    isEditing.value = -1;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    contentPadding: const EdgeInsets.all(4.0),
                                  ),
                                ),
                              )
                            : Text(
                                verses.current[index],
                                style: TextStyle(
                                  fontFamily: 'PlaypenSans',
                                ),
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  textController.text = verses.current[index];
                                  isEditing.value = index;

                                  _showKeyboard();
                                },
                                icon: const Icon(Icons.edit)),
                            Container(
                              decoration: BoxDecoration(border: Border.all()),
                              child: IconButton(
                                  padding: const EdgeInsets.all(
                                      4.0), // Adjust padding
                                  constraints: const BoxConstraints(
                                    minWidth:
                                        24.0, // Adjust these values to make the button smaller
                                    minHeight: 24.0,
                                  ),
                                  onPressed: () {
                                    onRemove(verses.current[index]);
                                  },
                                  icon: const Icon(Icons.delete_forever)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 5.h,
                ); // Customize this divider as needed
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
