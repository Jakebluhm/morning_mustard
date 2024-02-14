import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:morning_mustard/providers/game/box_burdens_provider.dart';
import 'package:morning_mustard/services/navigation_service/navigation_service.dart';
import 'package:morning_mustard/widgets/burden_modal_widget.dart';
import 'package:morning_mustard/widgets/heart_modal_widget.dart';

class BoxPage extends HookConsumerWidget {
  BoxPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boxOpen = useState(false);
    final burdens = ref.watch(burdensProvider);
    final burdensNotifier = ref.watch(burdensProvider.notifier);

    final currentBurden = useState<String>("");
    final TextEditingController burdenController = useTextEditingController();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double imageHeight = screenHeight * 0.25;

    // Function to add a verse to the list
    void addBurden(String burden) {
      if (burden.isNotEmpty) {
        burdensNotifier.addBurden(burden);
        currentBurden.value = burden;
        burdenController.clear();
      }
    }

    // Function to add a burden to the list
    void deleteBurden(String burden) {
      if (burden == currentBurden.value) {
        currentBurden.value = '';
      }
      burdensNotifier.deleteBurden(burden);
    }

    void onInfoPress(
      BuildContext context,
    ) {
      showDialog(
        context: context,
        builder: (BuildContext context) => BurdenModal(onRemove: deleteBurden),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Burdens',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Kalam',
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 205, 88, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.navigationService.goToMenuPage();
            debugPrint("Left Icon button pressed!");
          },
        ),
      ),
      body: Container(
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
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: pi,
                  child: CustomPaint(
                    size: Size(screenWidth, screenHeight * 0.27),
                    painter: TrianglePainter(),
                  ),
                ),
                Image.asset(
                  'lib/assets/TreasureBox/Ellipse 1.imageset/Ellipse 1.png',
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: const Text(
                    'Lord, I place my burden into Your care as I put it into this box. As long as it is in Your box, I never have to worry about it again.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Kalam',
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'lib/assets/TreasureBox/Shape 1.imageset/Shape 1.png',
                    fit: BoxFit.contain,
                  ),
                  const Text(
                    "My Burden Box",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Kalam',
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (boxOpen.value) {
                    onInfoPress(context);
                  }
                  boxOpen.value = true;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      boxOpen.value
                          ? Transform.translate(
                              offset: Offset(imageHeight * 0.07, 0),
                              child: Image.asset(
                                'lib/assets/TreasureBox/box_opened.png',
                                fit: BoxFit.contain,
                                width: imageHeight,
                              ),
                            )
                          : Transform.translate(
                              offset: Offset(imageHeight * 0.07, 0),
                              child: Image.asset(
                                'lib/assets/TreasureBox/box_closed.png',
                                fit: BoxFit.contain,
                                width: imageHeight,
                              ),
                            ),
                      currentBurden.value.isNotEmpty
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Transform.translate(
                                offset: Offset(0, imageHeight * -0.12),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color: burdens.current.length > 0
                                          ? Colors.white.withOpacity(0.65)
                                          : Colors.transparent),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      currentBurden.value,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Kalam',
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
            boxOpen.value
                ? Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      style: TextStyle(
                        fontFamily: 'Kalam',
                      ),
                      controller: burdenController,
                      onSubmitted: addBurden,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Add a Burden',
                          labelStyle: TextStyle(
                            fontFamily: 'Kalam',
                          )),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color.fromRGBO(46, 107, 86, 1)
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
