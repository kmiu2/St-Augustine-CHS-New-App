import 'package:flutter/material.dart';
import 'package:staugustinechsnewapp/screens/layout/page_layout.dart';
import 'package:staugustinechsnewapp/styles.dart';
import 'package:staugustinechsnewapp/widgets/reusable/basic_container.dart';
import 'package:staugustinechsnewapp/widgets/reusable/screen_header.dart';
import 'package:staugustinechsnewapp/widgets/reusable/text_arrow_container.dart';

class SettingsScreen extends StatelessWidget {
  final void Function() onPressedLogout;
  final void Function() onPressedFAQ;

  const SettingsScreen(
      {Key? key, required this.onPressedLogout, required this.onPressedFAQ})
      : super(key: key);

  Widget buildOptions() {
    return BasicContainer(
        child: Column(
      children: [
        TextButton(
            onPressed: onPressedLogout,
            child: const Text('Log Out', style: Styles.normalSubText)),
      ],
    ));
  }

  Widget buildFAQ() {
    return TextArrowContainer(text: 'FAQ', onPressed: onPressedFAQ);
  }

  @override
  Widget build(BuildContext context) {
    return PageLayout(
      children: [
        const ScreenHeader(headerText: 'Settings'),
        const SizedBox(height: Styles.mainSpacing),
        buildOptions(),
        const SizedBox(height: Styles.mainSpacing),
        buildFAQ(),
      ],
    );
  }
}
