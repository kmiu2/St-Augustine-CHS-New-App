import 'package:flutter/material.dart';
import 'package:staugustinechsnewapp/models/home/verse_of_day/verse_of_day.dart';
import 'package:staugustinechsnewapp/theme/styles.dart';
import 'package:staugustinechsnewapp/widgets/reusable/basic_container.dart';

class ChaplaincyCorner extends StatelessWidget {
  final VerseOfDay? verseOfDay;

  const ChaplaincyCorner({Key? key, this.verseOfDay}) : super(key: key);

  Widget buildVerseOfDay(BuildContext context, VerseOfDay verseOfDay) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
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
            const Text(
              'Verse of The Day',
              style: Styles.normalSubText,
            ),
            Text(
              verseOfDay.verseOfDay,
              style: Styles.normalText,
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BasicContainer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Chaplaincy Corner', style: Styles.normalMainText),
        const SizedBox(height: 20.0),
        verseOfDay != null
            ? buildVerseOfDay(context, verseOfDay!)
            : const Text('Loading...'),
      ],
    ));
  }
}
