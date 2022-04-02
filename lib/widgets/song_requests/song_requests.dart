import 'package:flutter/material.dart';
import 'package:staugustinechsnewapp/models/songs/song/song.dart';
import 'package:staugustinechsnewapp/styles.dart';
import 'package:staugustinechsnewapp/widgets/reusable/rounded_button.dart';

class SongRequests extends StatefulWidget {
  final List<Song> songs;
  final Function() onAddSong;
  final Function(bool upvoted, String songName) onUpvote;

  const SongRequests(
      {Key? key,
      required this.songs,
      required this.onAddSong,
      required this.onUpvote})
      : super(key: key);

  @override
  State<SongRequests> createState() => _SongRequestsState();
}

class _SongRequestsState extends State<SongRequests> {
  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  Widget buildSongInfo(String songName, String artistName) {
    return Expanded(
        child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            decoration: BoxDecoration(
                color: Styles.white,
                border: Border.all(
                  color: Styles.primary,
                  width: 1.0,
                ),
                borderRadius: Styles.mainBorderRadius),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  songName,
                  style: Styles.normalSubText,
                ),
                Text(
                  'By: $artistName',
                  style: Styles.normalText,
                ),
              ],
            )));
  }

  List<Widget> buildItems() {
    List<Widget> songs = [];
    for (var song in widget.songs) {
      Color upvoteColor = Styles.white;

      songs.add(Container(
          width: getWidth(context),
          decoration: const BoxDecoration(
              color: Styles.primary, borderRadius: Styles.mainBorderRadius),
          child: Row(children: [
            Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () => widget.onUpvote(true, song.name),
                        icon: Icon(Icons.keyboard_arrow_up_rounded,
                            color: upvoteColor)),
                    Text(
                      song.upvotes.toString(),
                      style:
                          const TextStyle(color: Styles.white, fontSize: 12.0),
                    ),
                  ],
                )),
            buildSongInfo(song.name, song.artist),
          ])));
      songs.add(const SizedBox(height: 10.0));
    }
    return songs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Styles.white,
            borderRadius: Styles.mainBorderRadius,
            boxShadow: Styles.normalBoxShadow),
        padding: const EdgeInsets.all(Styles.mainInsidePadding),
        width: getWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundedButton(text: 'Add Song', onPressed: widget.onAddSong),
            const SizedBox(height: Styles.mainSpacing),
            ...buildItems(),
          ],
        ));
  }
}
