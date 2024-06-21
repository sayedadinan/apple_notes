import 'package:apple_notes/data/modal/note_modal.dart';
import 'package:apple_notes/data/repositery/data_repo.dart';
import 'package:apple_notes/screens/list_screen.dart';
import 'package:apple_notes/utils/mediaquery.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// Import Material for MediaQuery

class NoteAddScreen extends StatefulWidget {
  const NoteAddScreen({super.key});

  @override
  _NoteAddScreenState createState() => _NoteAddScreenState();
}

class _NoteAddScreenState extends State<NoteAddScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  bool _isTitle = true; // Track whether the user is typing in the title

  @override
  void dispose() {
    _titleController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black, // Set background color
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.darkBackgroundGray,
        middle: const Text(
          'Data',
          style: TextStyle(
            color: CupertinoColors.systemYellow,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // Add your onPressed code here
              },
              child: const Icon(
                CupertinoIcons.settings_solid,
                color: CupertinoColors.systemYellow, // Customize icon color
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                inserting(_titleController.text, _notesController.text);
                Get.to(
                  const ListScreen(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 1050),
                );
              },
              child: const Text(
                'Done',
                style: TextStyle(
                  color: CupertinoColors.systemYellow,
                ),
              ),
            ),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Stretch items horizontally
        children: [
          CupertinoTextField(
            decoration: const BoxDecoration(color: CupertinoColors.black),
            controller: _titleController,
            padding: const EdgeInsets.all(12.0),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: CupertinoColors.white,
              fontSize: _isTitle
                  ? mediaquerywidth(0.08, context)
                  : mediaquerywidth(
                      0.05, context), // Adjust font size based on _isTitle
            ),
            placeholder: 'Title here', // Placeholder text
            placeholderStyle: TextStyle(
              color: CupertinoColors.white.withOpacity(0.5),
              fontSize: mediaquerywidth(0.08, context),
            ),
            cursorColor: CupertinoColors.white,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            onChanged: (value) {
              setState(() {
                _isTitle = _titleController.text.split('\n').length ==
                    1; // Check if typing in title
              });
            },
          ),
          const SizedBox(height: 16.0),
          CupertinoTextField(
            decoration: const BoxDecoration(color: CupertinoColors.black),
            controller: _notesController,
            padding: const EdgeInsets.all(12.0),
            style:
                const TextStyle(color: CupertinoColors.white, fontSize: 16.0),
            placeholder: 'Enter your notes...', // Placeholder text
            placeholderStyle: TextStyle(
                color: CupertinoColors.white.withOpacity(0.5),
                fontSize: 18.0,
                fontWeight: FontWeight.w500),
            cursorColor: CupertinoColors.white,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            textInputAction: TextInputAction.done,
            onSubmitted: (value) {
              // Handle submission
            },
          ),
        ],
      ),
    );
  }
}

inserting(title, notes) async {
  print(DateTime.now());
  final data =
      NoteModel(title: title, notes: notes, date: DateTime.now().toString());
  await DataStorage().insertData(data);
}
