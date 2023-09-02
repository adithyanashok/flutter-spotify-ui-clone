import 'package:flutter/material.dart';
import 'package:spotify_clone/view/home/home_screen.dart';
import 'package:spotify_clone/view/library_screen/library_screen.dart';
import 'package:spotify_clone/view/main_screen/bottom_nav.dart';
import 'package:spotify_clone/view/search_screen/search_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(),
      SearchScreen(),
      LibraryScreen(),
    ];
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: changeIndexNotifier,
          builder: (context, value, child) {
            return screens[value];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
