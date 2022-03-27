import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:staugustinechsnewapp/styles.dart';
import 'package:staugustinechsnewapp/utilities/auth/auth_bloc.dart';
import 'package:staugustinechsnewapp/utilities/home/home_bloc.dart';
import 'package:staugustinechsnewapp/widgets/home/announcements_board.dart';
import 'package:staugustinechsnewapp/widgets/home/chaplaincy_corner.dart';
import 'package:staugustinechsnewapp/widgets/home/featured_cafe_items.dart';
import 'package:staugustinechsnewapp/widgets/home/spirit_meter.dart';
import 'package:staugustinechsnewapp/widgets/home/welcome_banner.dart';
import 'package:staugustinechsnewapp/widgets/reusable/custom_snackbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc;

  List<Map<String, String>> sampleFeaturedCafeItems = [
    {
      'food': 'Caramel Latte',
      'image': 'assets/images/cat.jpg',
    },
    {
      'food': 'Mocha',
      'image': 'assets/images/cat.jpg',
    },
    {
      'food': 'Pumpkin Spice Latte with Vanilla Cream',
      'image': 'assets/images/cat.jpg',
    },
  ];

  @override
  void initState() {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(const HomeEvent.getDayNumber());
    homeBloc.add(const HomeEvent.getGeneralAnnouncements());
    homeBloc.add(const HomeEvent.getSpiritMeters());
    homeBloc.add(const HomeEvent.getVerseOfDay());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
      return BlocConsumer<HomeBloc, HomeState>(listenWhen: (previous, current) {
        return (previous.failure == null && current.failure != null);
      }, listener: (context, state) {
        if (state.failure != null) {
          useCustomSnackbar(
              context: context, message: state.failure!.message, isError: true);
          homeBloc.add(const HomeEvent.resetFailSuccess());
        }
      }, builder: (context, homeState) {
        return SafeArea(
          child: ListView(
            padding: Styles.mainOutsidePadding,
            children: <Widget>[
              const SizedBox(height: Styles.mainVerticalPadding),
              WelcomeBanner(
                dayNumber: homeState.dayNumber,
                userName: authState.user?.displayName,
              ),
              const SizedBox(height: Styles.mainSpacing),
              AnnouncementsBoard(
                announcements: homeState.generalAnnouncements,
              ),
              const SizedBox(height: Styles.mainSpacing),
              FeaturedCafeItems(cafeItems: sampleFeaturedCafeItems),
              const SizedBox(height: Styles.mainSpacing),
              SpiritMeterBars(
                spiritMeters: homeState.spiritMeters,
              ),
              const SizedBox(height: Styles.mainSpacing),
              ChaplaincyCorner(verseOfDay: homeState.verseOfDay),
              const SizedBox(height: Styles.mainVerticalPadding),
            ],
          ),
        );
      });
    });
  }
}
