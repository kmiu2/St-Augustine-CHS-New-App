import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:staugustinechsnewapp/screens/main/profile_screen.dart';
import 'package:staugustinechsnewapp/styles.dart';
import 'package:staugustinechsnewapp/utilities/navigation/nav_bloc.dart';

class ProfileScaffold extends StatefulWidget {
  const ProfileScaffold({Key? key}) : super(key: key);
  @override
  State<ProfileScaffold> createState() => _ProfileScaffoldState();
}

class _ProfileScaffoldState extends State<ProfileScaffold> {
  late NavBloc navBloc;

  @override
  void initState() {
    navBloc = BlocProvider.of<NavBloc>(context);
    super.initState();
  }

  void onPressedSettings() {
    navBloc.add(const NavEvent.changeScreen(screen: ENav.settings));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height:
            MediaQuery.of(context).size.height * Styles.backgroundBannerDepth,
        decoration: const BoxDecoration(
          color: Styles.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Styles.mainBorderRadiusValue),
            bottomRight: Radius.circular(Styles.mainBorderRadiusValue),
          ),
        ),
      ),
      ProfileScreen(onPressedSettings: onPressedSettings),
    ]);
  }
}
