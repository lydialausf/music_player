import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/player_screen.dart';

// ignore: must_be_immutable
class ListOfSongs extends StatelessWidget {
  ListOfSongs({super.key});

  final List<Map<String, dynamic>> songs = [
    {
      "imageUrl": "images/katebush.png",
      "title": "Running Up That Hill",
      "artist": "Kate Bush",
      "album": "Hounds of Love",
      "year": "1985",
      "songUrl": "asset:///audio/running.mp3",
    },
    {
      "imageUrl": "images/yinguo.png",
      "title": "因果 (Karma)",
      "artist": "SKAI isyourgod",
      "album": "八方來財",
      "year": "2024",
      "songUrl": "asset:///audio/yinguo.mp3",
    },
    {
      "imageUrl": "images/fantastic.png",
      "title": "Fantastic (from the series Arcane League of Legends)",
      "artist": "King Princess",
      "album":
          "Arcane League of Legends: Season 2 (Soundtrack from the animated series)",
      "songUrl": "asset:///audio/fantastic.mp3",
    },
    {
      "imageUrl": "images/guess.png",
      "title": "Guess featuring billie eilish (feat. Billie Eilish)",
      "artist": "Charli xcx & Billie Eilish",
      "album": "Guess featuring Billie Eilish",
      "songUrl": "asset:///audio/guess.mp3",
    }
  ];

  AudioPlayer? currentPlayer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of my favorite songs!"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(songs[index]["imageUrl"]),
                  title: Text(
                    songs[index]["title"],
                  ),
                  subtitle: Text(songs[index]["artist"]),
                  trailing: Icon(Icons.play_arrow),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return PlayerScreen(
                        song: songs[index], previousPlayer: currentPlayer);
                  })),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: songs.length),
        ],
      ),
    );
  }
}
