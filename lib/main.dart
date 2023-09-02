import 'package:flutter/material.dart';
import 'package:spotify_clone/view/core/color/colors.dart';
import 'package:spotify_clone/view/main_screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: AppColor.colorBlack),
        scaffoldBackgroundColor: AppColor.scaffoldBackgroundColor,
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
