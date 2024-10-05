import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morning_mustard/providers/game/heart_verses_provider.dart';
import 'package:morning_mustard/services/navigation_service/navigation_service.dart';
import 'package:morning_mustard/widgets/custom_text_clipper.dart';
import 'package:morning_mustard/widgets/heart_container_widget.dart';
import 'package:morning_mustard/widgets/heart_modal_widget.dart';

class HeartPage extends HookConsumerWidget {
  HeartPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verses = ref.watch(versusProvider);
    final VersesNotifier = ref.watch(versusProvider.notifier);

    final showText = useState(false);

    final currentVerse = useState<String>("");
    final TextEditingController verseController = useTextEditingController();

    double screenHeight = MediaQuery.of(context).size.height;

    // Function to add a verse to the list
    void addVerse(String verse) {
      if (verse.isNotEmpty) {
        VersesNotifier.addVerse(verse);
        currentVerse.value = verse;
        verseController.clear();
        showText.value = true;
      }
    }

    // Function to add a verse to the list
    void deleteVerse(String verse) {
      if (verse == currentVerse.value) {
        currentVerse.value = '';
      }
      VersesNotifier.deleteVerse(verse);
    }

    void onInfoPress(
      BuildContext context,
    ) {
      showDialog(
        context: context,
        builder: (BuildContext context) => HeartModal(onRemove: deleteVerse),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Heart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlaypenSans',
          ),
        ),
        backgroundColor: const Color.fromRGBO(255, 205, 88, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.navigationService.goToMenuPage();
            debugPrint("Left Icon button pressed!");
          },
        ),
      ),
      body: LayoutBuilder(// Use LayoutBuilder to get parent constraints
          builder: (context, constraints) {
        return SingleChildScrollView(
          child: Container(
            // Ensure there's a constrained height for the column
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(255, 219, 88, 1.0),
                    Color.fromRGBO(0xf7, 0xd4, 0x86, 1.0),
                    Color.fromRGBO(0xc5, 0xf9, 0xd7, 1.0),
                  ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 50.h,
                      right: MediaQuery.of(context).size.width * 0.05,
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: Column(
                    children: [
                      Stack(
                        children: <Widget>[
                          // Outline text
                          Text(
                            "Psalm 119:11",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'PlaypenSans',
                              letterSpacing: 2,
                              fontSize: 36,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 4
                                ..color = Color.fromARGB(255, 224, 122, 54),
                              shadows: [
                                Shadow(
                                  offset: Offset(3.0, 3),
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.85),
                                ),
                              ],
                            ),
                          ),
                          // Filled text
                          const Text(
                            "Psalm 119:11",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'PlaypenSans',
                              letterSpacing: 2,
                              fontSize: 36,
                              color: Colors
                                  .white, // Change to your desired fill color
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: <Widget>[
                          // Outline text
                          Text(
                            "Thy Word have I hid in my heart, that I might not sin against Thee.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'PlaypenSans',
                              letterSpacing: 2,
                              fontSize: 24,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 3
                                ..color = Color.fromARGB(255, 224, 122, 54),
                              shadows: [
                                Shadow(
                                  offset: Offset(3.0, 3),
                                  blurRadius: 5.0,
                                  color: Colors.black.withOpacity(0.85),
                                ),
                              ],
                            ),
                          ),
                          // Filled text
                          const Text(
                            "Thy Word have I hid in my heart, that I might not sin against Thee.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'PlaypenSans',
                              letterSpacing: 2,
                              fontSize: 24,
                              color: Colors
                                  .white, // Change to your desired fill color
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onInfoPress(context);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/heart/heart.imageset/heart.png',
                        fit: BoxFit.contain,
                      ),
                      showText.value
                          ? Container(
                              //decoration: BoxDecoration(border: Border.all()),
                              width: 230.w,
                              height: 100.h,
                              padding: EdgeInsets.symmetric(horizontal: 0.0.w),
                              margin: EdgeInsets.only(bottom: 60.h),
                              child: Align(
                                alignment: Alignment.center,
                                child: SingleChildScrollView(
                                  child: Text(
                                    currentVerse.value,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'PlaypenSans',
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 18.0.w,
                    right: 18.0.w,
                    top: 8.0.h,
                    bottom: 18.0.w,
                  ),
                  child: TextField(
                    style: const TextStyle(
                      fontFamily: 'PlaypenSans',
                    ),
                    controller: verseController,
                    onSubmitted: addVerse,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Add a Verse',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
