import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:staugustinechsnewapp/models/socials/club/club.dart';
import 'package:staugustinechsnewapp/styles.dart';
import 'package:staugustinechsnewapp/widgets/reusable/image_shadow_container.dart';
import 'package:staugustinechsnewapp/widgets/reusable/rounded_button.dart';

class ClubsList extends StatefulWidget {
  final String title;
  final List<Club> items;
  final bool showJoinClubsButton;
  final Function(String) onPressClub;
  final Function()? onPressJoinClubsButton;

  const ClubsList(
      {Key? key,
      required this.title,
      required this.items,
      required this.onPressClub,
      this.showJoinClubsButton = true,
      this.onPressJoinClubsButton})
      : super(key: key);

  @override
  State<ClubsList> createState() => _ClubsListState();
}

class _ClubsListState extends State<ClubsList> {
  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  Widget buildTile({required String clubId, required String name}) {
    double tileWidth = getWidth(context) - (Styles.mainOutsidePadding * 2);

    return Container(
        height: Styles.pictureContainerHeight,
        width: tileWidth,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            name,
            textAlign: TextAlign.start,
            style: const TextStyle(
                fontFamily: Styles.fontFamilyNormal,
                fontWeight: FontWeight.bold,
                color: Styles.white),
          ),
        ));
  }

  Widget buildTileWrapper(
      {required String clubId,
      required String name,
      required String pictureUrl}) {
    return Stack(children: [
      ImageShadowContainer(pictureUrl: pictureUrl),
      Material(
          color: Styles.transparent,
          child: InkWell(
              borderRadius: Styles.mainBorderRadius,
              splashColor: Styles.primary,
              onTap: () => widget.onPressClub(clubId),
              child: buildTile(clubId: clubId, name: name)))
    ]);
  }

  Widget buildItems() {
    List<Widget> rows = [];
    for (int i = 0; i < widget.items.length; i += 1) {
      rows.add(
        buildTileWrapper(
            clubId: widget.items[i].id,
            name: widget.items[i].name,
            pictureUrl: widget.items[i].pictureUrl),
      );
      rows.add(const SizedBox(height: 10.0));
    }
    return Column(children: rows);
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
            Text(widget.title, style: Styles.normalMainText),
            const SizedBox(height: Styles.mainSpacing),
            buildItems(),
            if (widget.showJoinClubsButton) ...[
              const SizedBox(height: Styles.mainSpacing),
              RoundedButton(
                text: 'Join a Club',
                onPressed: widget.onPressJoinClubsButton ?? () {},
              ),
            ]
          ],
        ));
  }
}
