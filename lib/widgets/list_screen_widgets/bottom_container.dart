import 'package:apple_notes/screens/note_add.dart';
import 'package:apple_notes/utils/app_customsizedbox.dart';
import 'package:apple_notes/utils/app_text.dart';
import 'package:apple_notes/utils/mediaquery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as GetX;

class BottomContainer extends StatelessWidget {
  final int count;
  const BottomContainer({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: mediaqueryheight(0.08, context),
        color: const Color.fromARGB(255, 55, 53, 53),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppText(
              weight: FontWeight.w300,
              text: '$count Notes',
              size: 0.03,
            ),
            const CustomSizedBoxWidth(0.33),
            IconButton(
              onPressed: () {
                GetX.Get.to(const NoteAddScreen(),
                    duration: const Duration(milliseconds: 450),
                    transition: GetX.Transition.downToUp);
              },
              icon: const Icon(
                CupertinoIcons.pencil_ellipsis_rectangle,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
