import 'package:apple_notes/screens/list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_cupertino_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetCupertinoApp(
      theme: CupertinoThemeData(
          scaffoldBackgroundColor: CupertinoColors.black,
          primaryColor: CupertinoColors.systemYellow),
      color: CupertinoColors.black,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ListScreen(),
    );
  }
}
