import 'package:flutter/cupertino.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CupertinoSearchTextField(
        controller: _searchController,
        itemColor: const Color.fromARGB(255, 207, 203, 203),
        autocorrect: true,
        backgroundColor: const Color.fromARGB(255, 55, 53, 53),
      ),
    );
  }
}
