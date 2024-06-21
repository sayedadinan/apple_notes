import 'package:apple_notes/utils/mediaquery.dart';
import 'package:flutter/cupertino.dart';

class TitleTextEditingController extends StatelessWidget {
  final TextEditingController titleController;
  const TitleTextEditingController({super.key, required this.titleController});

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      decoration: const BoxDecoration(color: CupertinoColors.black),
      controller: titleController,
      padding: const EdgeInsets.all(12.0),
      style: TextStyle(
          fontWeight: FontWeight.w600,
          color: CupertinoColors.white,
          fontSize: mediaquerywidth(0.08, context)),
      placeholder: 'Title here',
      placeholderStyle: TextStyle(
        color: CupertinoColors.white.withOpacity(0.5),
        fontSize: mediaquerywidth(0.08, context),
      ),
      cursorColor: CupertinoColors.white,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      onChanged: (value) {},
    );
  }
}
