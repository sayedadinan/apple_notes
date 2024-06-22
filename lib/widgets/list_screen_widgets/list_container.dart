import 'package:apple_notes/utils/app_customsizedbox.dart';
import 'package:apple_notes/utils/app_text.dart';
import 'package:flutter/cupertino.dart';

class ListContainer extends StatelessWidget {
  final String title;
  final String notes;
  const ListContainer({
    super.key,
    required this.title,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            text: title,
            size: 0.05,
          ),
          const CustomSizedBoxHeight(0.01),
          AppText(
            weight: FontWeight.w400,
            text: notes,
            size: 0.04,
          ),
        ],
      ),
    );
  }
}
