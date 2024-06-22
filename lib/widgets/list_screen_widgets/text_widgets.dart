import 'package:apple_notes/utils/app_text.dart';
import 'package:apple_notes/utils/mediaquery.dart';
import 'package:flutter/cupertino.dart';

class NotesText extends StatelessWidget {
  const NotesText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: mediaquerywidth(0.04, context),
        top: mediaqueryheight(0.01, context),
      ),
      child: const Row(
        children: [
          AppText(
            weight: FontWeight.w700,
            text: 'Notes',
            size: 0.09,
          ),
        ],
      ),
    );
  }
}

class Name_widget extends StatelessWidget {
  const Name_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: mediaquerywidth(0.05, context),
        top: mediaqueryheight(0.01, context),
      ),
      child: const Row(
        children: [
          AppText(
            weight: FontWeight.w700,
            text: 'Today',
            size: 0.05,
          ),
        ],
      ),
    );
  }
}
