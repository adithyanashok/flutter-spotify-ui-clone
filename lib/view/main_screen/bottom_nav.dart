import 'package:flutter/material.dart';

ValueNotifier<int> changeIndexNotifier = ValueNotifier(0);

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // change index of navigation bar through valuelistenable builder
    return ValueListenableBuilder(
      // changeIndexNotifier is the value notifier
      valueListenable: changeIndexNotifier,
      builder: (context, value, child) {
        // Return BottomNavigation bar widget
        return BottomNavigationBar(
          currentIndex: value,
          onTap: (value) {
            changeIndexNotifier.value = value;
          },
          // <=====================Styles=================>
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.white,
          iconSize: 20,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          //<================= Bottom Nav items=================>
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books_sharp),
              label: "Your Library",
            ),
          ],
        );
      },
    );
  }
}
