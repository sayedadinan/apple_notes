import 'package:apple_notes/utils/mediaquery.dart';
import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  const AppText(
      {super.key,
      required this.text,
      required this.size,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: weight,
        fontSize: mediaquerywidth(size, context),
        color: const CupertinoDynamicColor.withBrightness(
          color: CupertinoColors.white,
          darkColor: CupertinoColors.white,
        ),
      ),
    );
  }
}
