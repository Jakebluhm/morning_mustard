import 'package:morning_mustard/router/app_router_constants.dart';

class ActsButtonItem {
  final String imagePath;
  final String text;

  ActsButtonItem({required this.imagePath, required this.text});
}

List<ActsButtonItem> actsItems = [
  ActsButtonItem(
      imagePath: 'lib/assets/ACTS/ic_a.imageset/ic_a.png',
      text:
          "Adoration: I praise and worship God, The Son, and The Holy Spirit."),
  ActsButtonItem(
      imagePath: 'lib/assets/ACTS/ic_c.imageset/ic_c.png',
      text:
          "Confession: I confess any sins that the Holy Spirit might reveal to me."),
  ActsButtonItem(
      imagePath: 'lib/assets/ACTS/ic_t.imageset/ic_t.png',
      text:
          "Thanksgiving: I am thankful for all the many blessings God has provided for me."),
  ActsButtonItem(
      imagePath: 'lib/assets/ACTS/ic_s.imageset/ic_s.png',
      text:
          "Surrender: I surrender my life to You, Lord God, in everything I do, say or plan."),
  ActsButtonItem(
      imagePath: 'lib/assets/ACTS/ic_a_side.imageset/ic_a_side.png',
      text:
          "He is infinite, the one and only, all-knowing, all-powerful, all-wise, unchanging, He is Love, everywhere, holy, pure, just, righteous, truthful, good, patient, and kind."),
  ActsButtonItem(
      imagePath: 'lib/assets/ACTS/ic_c_side.imageset/ic_c_side.png',
      text:
          "Have I been impatient, or rude? Am I envious, boasting, or prideful? Am I disrespectful or condescending? Am I self-seeking, easily angered, or unforgiving? Do I delight in evil and rejoice in lies? Am I cowardly when others are being harmed, am I haughty or fickle?\nThis is very important, for it keeps me humble before the cross!"),
  ActsButtonItem(
      imagePath: 'lib/assets/ACTS/ic_t_side.imageset/ic_t_side.png',
      text:
          "Salvation from hell, God’s commitment to His Unchanging Word, family and friends, health and safety, etc.\nAlways so much for which to be thankful."),
  ActsButtonItem(
    imagePath: 'lib/assets/ACTS/ic_s_side.imageset/ic_s_side.png',
    text:
        "All my hopes, dreams and plans, every part of my life I hold out to You, for it is not mine but Yours, because You created me, died for me, saved me and love me! And You know what is best for me! I now live for You, Lord Jesus, not myself!",
  ),
];
