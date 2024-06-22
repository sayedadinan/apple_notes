import 'package:apple_notes/blocs/bloc/mainlist_bloc.dart';
import 'package:apple_notes/utils/app_customsizedbox.dart';
import 'package:apple_notes/widgets/list_screen_widgets/bottom_container.dart';
import 'package:apple_notes/widgets/list_screen_widgets/note_listview.dart';
import 'package:apple_notes/widgets/list_screen_widgets/search_bar.dart';
import 'package:apple_notes/widgets/list_screen_widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<MainlistBloc>().add(LoadNotes());

    searchController.addListener(() {
      final query = searchController.text;
      if (query.isEmpty) {
        context.read<MainlistBloc>().add(LoadNotes());
      } else {
        context.read<MainlistBloc>().add(SearchNotes(query: query));
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:
          const CupertinoNavigationBar(backgroundColor: Colors.black),
      backgroundColor: CupertinoColors.black,
      child: BlocConsumer<MainlistBloc, MainlistState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is NotesLoaded) {
            return Stack(
              children: [
                Column(
                  children: [
                    const NotesText(),
                    const CustomSizedBoxHeight(0.01),
                    CustomSearchBar(searchController: searchController),
                    const Name_widget(),
                    const CustomSizedBoxHeight(0.01),
                    NoteList(notes: state.notes),
                  ],
                ),
                BottomContainer(count: state.notes.length),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
