import 'package:flutter/material.dart';
import 'package:spotify_clone/data/playlist_song_data.dart';
import 'package:spotify_clone/view/core/color/colors.dart';
import 'package:spotify_clone/widgets/icons_widgets.dart';
import 'package:spotify_clone/widgets/text_widgets.dart';

class PlayListScreen extends StatelessWidget {
  PlayListScreen({super.key});
  final songs = PlayListSongs().songs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(248, 48, 40, 1.0),
        iconTheme: IconThemeData(color: AppColor.colorWhite),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color.fromRGBO(248, 48, 40, 1.0),
                  AppColor.colorBlack1,
                ],
              ),
            ),
            height: 410,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Card(
                    elevation: 10,
                    child: Image.network(
                      'https://dailymix-images.scdn.co/v2/img/ab6761610000e5eb78cb99533f34d137d2c05f19/2/en/default',
                      width: 210,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  child: buildText(text: "Daily Mix 2"),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 11),
                  child: Text(
                    'Emiway Bantai + 1',
                    style: TextStyle(
                      color: AppColor.colorGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 11),
                  child: Text(
                    'Album . 2023',
                    style: TextStyle(
                      color: AppColor.colorGrey,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        buildIcon(icon: Icons.favorite_border_outlined),
                        buildIcon(icon: Icons.download_for_offline_outlined),
                        buildIcon(icon: Icons.more_vert_outlined),
                      ],
                    ),
                    Row(
                      children: [
                        buildIcon(icon: Icons.shuffle),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor:
                              const Color.fromARGB(255, 73, 172, 76),
                          child: Icon(
                            Icons.play_arrow,
                            color: AppColor.colorWhite,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.separated(
            itemBuilder: (context, index) {
              final values = songs[index];
              return ListTile(
                title: Text(
                  '${values['title']}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  '${values['artist']}',
                  style: TextStyle(
                    color: AppColor.colorGrey,
                  ),
                ),
                trailing: Icon(
                  Icons.more_vert_rounded,
                  color: AppColor.colorGrey,
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 0,
            ),
            itemCount: songs.length,
          ))
        ],
      ),
    );
  }
}
