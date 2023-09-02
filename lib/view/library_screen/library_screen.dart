import 'package:flutter/material.dart';
import 'package:spotify_clone/data/library_data.dart';
import 'package:spotify_clone/view/core/color/colors.dart';
import 'package:spotify_clone/widgets/icons_widgets.dart';
import 'package:spotify_clone/widgets/text_button_widgets.dart';
import 'package:spotify_clone/widgets/text_widgets.dart';

class LibraryScreen extends StatefulWidget {
  LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final library = LibraryData().library;
  bool gridView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                "A",
                style: TextStyle(
                  color: AppColor.colorWhite,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            buildText(text: "Your Library")
          ],
        ),
        actions: [
          buildIcon(icon: Icons.search),
          buildIcon(icon: Icons.add),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextButton(text: "Artists"),
          const Divider(
            color: Colors.black,
            thickness: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.arrow_upward_outlined),
                  Text(
                    "Recents",
                    style: TextStyle(
                      color: AppColor.colorWhite,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      gridView = !gridView;
                    });
                  },
                  child: Icon(
                    Icons.grid_view_outlined,
                    size: 19,
                    color: AppColor.colorWhite,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: gridView == true
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        final values = library[index];
                        return Container(
                          color: AppColor.colorBlack1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(100)),
                                      child: Image.network(
                                        '${values['imgUrl']}',
                                        width: 100,
                                      ),
                                    ),
                                    Text(
                                      '${values['title']}',
                                      style: TextStyle(
                                        color: AppColor.colorWhite,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      '${values['subtitle']}',
                                      style: TextStyle(
                                        color: AppColor.colorGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: library.length,
                    ),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      final values = library[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 30,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                            child: Image.network(
                              '${values['imgUrl']}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        textColor: AppColor.colorWhite,
                        title: Text('${values['title']}'),
                        subtitle: Text(
                          '${values['subtitle']}',
                          style: TextStyle(
                            color: AppColor.colorGrey,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: library.length,
                  ),
          )
        ],
      ),
    );
  }
}
