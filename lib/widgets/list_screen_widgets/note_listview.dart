import 'package:apple_notes/blocs/bloc/mainlist_bloc.dart';
import 'package:apple_notes/data/modal/note_modal.dart';
import 'package:apple_notes/screens/preview_screen.dart';
import 'package:apple_notes/utils/mediaquery.dart';
import 'package:apple_notes/widgets/list_screen_widgets/list_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as GetX;

class NoteList extends StatelessWidget {
  final List<NoteModel> notes;
  const NoteList({
    super.key,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mediaquerywidth(0.05, context),
        ),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GestureDetector(
                onLongPress: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoActionSheet(
                        title: const Text(
                          'Are you sure to delete?\nthis note is going to delete from note',
                          style: TextStyle(
                              color: CupertinoColors.black, fontSize: 15),
                        ),
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () {
                              context
                                  .read<MainlistBloc>()
                                  .add(DeleteItem(id: notes[index].id!));
                              Navigator.of(context).pop();
                            },
                            isDestructiveAction: true,
                            child: const Text(
                              'Delete note',
                              style: TextStyle(
                                  color: CupertinoColors.systemRed,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                      );
                    },
                  );
                },
                onTap: () {
                  GetX.Get.to(NotePreviewScreen(
                      id: notes[index].id!,
                      date: notes[index].date,
                      note: notes[index].notes,
                      title: notes[index].title));
                },
                child: ListContainer(
                  notes: notes[index].notes,
                  title: notes[index].title,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
