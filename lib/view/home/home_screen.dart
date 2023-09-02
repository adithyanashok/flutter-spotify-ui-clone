import 'package:flutter/material.dart';
import 'package:spotify_clone/data/music_data.dart';
import 'package:spotify_clone/view/core/color/colors.dart';
import 'package:spotify_clone/widgets/icons_widgets.dart';
import 'package:spotify_clone/widgets/text_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final dailymix = MusicData().dailymix;
  final datas = MusicData().charts;
  final other = MusicData().other;
  final artists = MusicData().artists;
  final trending = MusicData().trending;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // AppBar
      appBar: AppBar(
        // Provided an Padding widget for title
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildText(text: "Good morning"),
        ),
        actions: [
          // three icons
          buildIcon(icon: Icons.notifications_none_sharp),
          buildIcon(icon: Icons.av_timer_sharp),
          buildIcon(icon: Icons.settings_outlined),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text buttons//
            Row(
              children: [
                buildTextButton(text: "Music"),
                buildTextButton(text: "Podcasts & Shows"),
              ],
            ),
            // Padding for the banner of premium ads
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              // Container widget
              child: Container(
                width: width * .9,
                // provided decoration
                decoration: BoxDecoration(
                  // image for banner
                  image: const DecorationImage(
                    // image from asset
                    image: AssetImage('assets/images/premium.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                // Column widget
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // provided Padding for a Row Widget//
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Text Widget
                          Text(
                            "Limited time offer",
                            style: TextStyle(
                              color: AppColor.colorWhite,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Extracted method of icon
                          buildIcon(icon: Icons.more_vert_sharp)
                        ],
                      ),
                    ),
                    // Container widget for content of ad
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: buildText(
                        text: "3 months of Spotify Premium, for free.",
                      ),
                    ),
                    // provided padding for Extracted text
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildSubText(
                          text:
                              "Monthly subscription fees applies after. Limited\neligibility. Terms and apply"),
                    )
                  ],
                ),
              ),
            ),
            // Chart section
            //<==================Listing contents(Musics, Albums, Artists)==============>
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: buildText(text: "Made for you"),
            ),
            //Padding for sized box
            buildMusicList(data: dailymix),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: buildText(text: "Charts"),
            ),
            //Padding for sized box
            buildMusicList(data: datas),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: buildText(text: "More of what you like"),
            ),
            //Padding for sized box
            buildMusicList(data: other),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: buildText(text: "Popular artists"),
            ),
            buildMusicList(data: artists, roundedImg: true),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: buildText(text: "Trending now"),
            ),
            buildMusicList(data: trending),
          ],
        ),
      ),
    );
  }

  Widget buildTextButton({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            AppColor.colorBlack1,
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(color: AppColor.colorWhite),
        ),
      ),
    );
  }

  Widget buildMusicList({required data, bool roundedImg = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.only(left: 13),
        height: 200,
        // List view
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final music = data[index];
            return SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  roundedImg == true
                      ? ClipOval(
                          child: Image.network(
                            music['imgurl']!,
                            width: 190,
                            height: 180,
                          ),
                        )
                      : Image.network(
                          music['imgurl']!,
                          width: 150,
                          height: 150,
                        ),
                  Center(
                    child: Text(
                      music['title']!,
                      style: TextStyle(
                        color: AppColor.colorWhite,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          itemCount: datas.length,
        ),
      ),
    );
  }
}
