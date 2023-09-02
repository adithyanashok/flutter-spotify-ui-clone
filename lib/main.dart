import 'package:flutter/material.dart';
import 'package:spotify_clone/view/core/color/colors.dart';
import 'package:spotify_clone/view/home/home_screen.dart';
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
        scaffoldBackgroundColor: Color.fromARGB(255, 22, 22, 22),
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}

class CropImageOverflow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Image Overflow'),
      ),
      body: Container(
        width: 400.0, // Set the desired width for your container
        height: 400.0, // Set the desired height for your container
        color: Colors.red,
        child: Stack(children: [
          const Text(
            "Widget",
            style: TextStyle(color: Colors.red),
          ),
          Positioned(
            bottom: -50,
            right: -10,
            width: 200,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(15 / 360),
              child: Image.network(
                  'https://i.scdn.co/image/ab6765630000ba8a9417936d038e7a2f8dee2554'),
            ),
          ),
          Positioned(
            top: -50,
            left: -10,
            width: 200,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(15 / 360),
              child: Image.network(
                  'https://i.scdn.co/image/ab6765630000ba8a9417936d038e7a2f8dee2554'),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -20,
            width: 200,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(10 / 360),
              child: Image.network(
                  'https://i.scdn.co/image/ab67fb8200005cafe914a07d20cec7a65e2e5dad'),
            ),
          ),
        ]),
      ),
    );
  }
}
