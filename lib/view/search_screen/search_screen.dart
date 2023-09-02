import 'package:flutter/material.dart';
import 'package:spotify_clone/data/grid_view_datas.dart';
import 'package:spotify_clone/view/core/color/colors.dart';
import 'package:spotify_clone/widgets/icons_widgets.dart';
import 'package:spotify_clone/widgets/text_widgets.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final gridViewData = GridViewData().datas;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: buildText(text: "Search"),
        ),
        actions: [
          buildIcon(
            icon: Icons.camera_alt_outlined,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: 350,
            height: 50,
            decoration: BoxDecoration(
              color: AppColor.colorBlack1,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Row(
              children: [
                buildIcon(icon: Icons.search_sharp),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: AppColor.colorWhite),
                    decoration: InputDecoration(
                      hintStyle:
                          TextStyle(color: AppColor.colorGrey, fontSize: 19),
                      hintText: "What do you want to listen to?",
                      //<========Border Styles==========>
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: buildText(text: "Browse all", fontSize: 18),
          ),
          buildGridView(data: gridViewData)
        ],
      ),
    );
  }

  Widget buildGridView({required List<Map<String, Object>> data}) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(15),
        //<=============Grid Delegate=================>
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.7,
        ),
        itemBuilder: (context, index) {
          final values = data[index];
          //<=============Container===============>
          return Container(
            decoration: BoxDecoration(
              color: values['color'] as Color,
              borderRadius: BorderRadius.circular(4),
            ),
            //<=============Stack===================>
            child: Stack(
              children: [
                //<===============Positioned widget for image===============>
                Positioned(
                  right: -22,
                  bottom: -10,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(28 / 360),
                    child: Card(
                      //elevation
                      elevation: 10,
                      child: Container(
                        width: 70,
                        height: 70,
                        //Decoration for container
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 250, 99, 29),
                          //Image
                          image: DecorationImage(
                            image: NetworkImage(values['imgUrl'].toString()),
                            fit: BoxFit.cover,
                          ),
                          //Border Radius
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomLeft: Radius.circular(4)),
                        ),
                      ),
                    ),
                  ),
                ),
                //<=================Title Section=============>
                Padding(
                  padding: const EdgeInsets.only(top: 6, left: 11),
                  //Text
                  child: Text(
                    values['title'].toString(),
                    style: const TextStyle(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                        fontFamily: "Raleway",
                        fontStyle: FontStyle.normal,
                        fontSize: 17.0),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
