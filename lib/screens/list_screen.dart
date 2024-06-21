import 'package:apple_notes/data/modal/note_modal.dart';
import 'package:apple_notes/data/repositery/data_repo.dart';
import 'package:apple_notes/screens/note_add.dart';
import 'package:apple_notes/screens/preview_screen.dart';
import 'package:apple_notes/utils/app_customsizedbox.dart';
import 'package:apple_notes/utils/app_text.dart';
import 'package:apple_notes/utils/mediaquery.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<NoteModel> _notes = [];
  final DataStorage _dataStorage = DataStorage();

  @override
  void initState() {
    super.initState();
    _fetchNotes();
  }

  Future<void> _fetchNotes() async {
    final data = await _dataStorage.getAllData();
    setState(() {
      _notes = data.map<NoteModel>((item) => NoteModel.fromMap(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: CupertinoButton(
          child: const Icon(
            CupertinoIcons.settings,
            color: Colors.amber,
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: CupertinoColors.black,
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
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
              ),
              const CustomSizedBoxHeight(0.01),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: CupertinoSearchTextField(
                  itemColor: Color.fromARGB(255, 207, 203, 203),
                  autocorrect: true,
                  backgroundColor: Color.fromARGB(255, 55, 53, 53),
                ),
              ),
              Padding(
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
              ),
              const CustomSizedBoxHeight(0.01),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: mediaquerywidth(0.05, context),
                  ),
                  child: ListView.builder(
                    itemCount: _notes.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(NotePreviewScreen(
                              id: _notes[index].id!,
                              date: _notes[index].date,
                              note: _notes[index].notes,
                              title: _notes[index].title,
                            ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 55, 53, 53),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.all(13.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  weight: FontWeight.w500,
                                  text: _notes[index].title,
                                  size: 0.05,
                                ),
                                const CustomSizedBoxHeight(0.01),
                                AppText(
                                  weight: FontWeight.w400,
                                  text: _notes[index].notes,
                                  size: 0.04,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Positioned(
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
                    text: '${_notes.length} Notes',
                    size: 0.03,
                  ),
                  const CustomSizedBoxWidth(0.33),
                  IconButton(
                      onPressed: () {
                        Get.to(const NoteAddScreen(),
                            duration: const Duration(milliseconds: 450),
                            transition: Transition.downToUp);
                      },
                      icon: const Icon(
                        CupertinoIcons.pencil_ellipsis_rectangle,
                        color: Colors.amber,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
