import 'package:apple_notes/utils/mediaquery.dart';
import 'package:flutter/cupertino.dart';

class NoteEditingController extends StatelessWidget {
  final TextEditingController notesController;
  const NoteEditingController({super.key, required this.notesController});

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      decoration: const BoxDecoration(color: CupertinoColors.black),
      controller: notesController,
      padding: const EdgeInsets.all(12.0),
      style: const TextStyle(color: CupertinoColors.white, fontSize: 25.0),
      placeholder: 'Enter your notes...', // Placeholder text
      placeholderStyle: TextStyle(
          color: CupertinoColors.white.withOpacity(0.5),
          fontSize: mediaquerywidth(0.06, context),
          fontWeight: FontWeight.w500),
      cursorColor: CupertinoColors.white,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textInputAction: TextInputAction.done,
      onSubmitted: (value) {
        // Handle submission
      },
    );
  }
}
