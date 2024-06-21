import 'dart:developer';
import 'package:apple_notes/data/modal/note_modal.dart';
import 'package:apple_notes/data/repositery/data_repo.dart';
import 'package:apple_notes/screens/list_screen.dart';
import 'package:apple_notes/widgets/note_editingcontroller.dart';
import 'package:apple_notes/widgets/title_editingcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotePreviewScreen extends StatefulWidget {
  final String title;
  final String note;
  final String date;
  final int id;

  const NotePreviewScreen({
    Key? key,
    required this.title,
    required this.note,
    required this.date,
    required this.id,
  }) : super(key: key);

  @override
  State<NotePreviewScreen> createState() => _NotePreviewScreenState();
}

class _NotePreviewScreenState extends State<NotePreviewScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.title;
    notesController.text = widget.note;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
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
                PopupMenuButton(
                  itemBuilder: (context) =>
                      [const PopupMenuItem(child: Text('Find in Note'))],
                );
              },
              child: const Icon(
                CupertinoIcons.settings_solid,
                color: CupertinoColors.systemYellow,
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                updateData(
                  titleController.text,
                  notesController.text,
                  widget.date,
                  widget.id,
                );
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
        children: [
          TitleTextEditingController(titleController: titleController),
          const SizedBox(height: 16.0),
          NoteEditingController(notesController: notesController),
        ],
      ),
    );
  }

  void showEditOptions() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoPopupSurface(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                onPressed: () {
                  // Handle edit title action
                  // Example: Navigator.pop(context);
                },
                child: const Text('Edit Title'),
              ),
              CupertinoButton(
                onPressed: () {
                  // Handle edit notes action
                  // Example: Navigator.pop(context);
                },
                child: const Text('Edit Notes'),
              ),
            ],
          ),
        );
      },
    );
  }

  void updateData(String title, String notes, String date, int id) async {
    log(title.toString());
    log(notes.toString());
    final data = NoteModel(title: title, notes: notes, date: date, id: id);
    await DataStorage().updateData(data);
  }
}
