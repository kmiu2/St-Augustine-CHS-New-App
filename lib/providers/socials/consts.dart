import 'package:staugustinechsnewapp/providers/network.dart';

String addClubEndpoint = getCloudFunctionsDomain() + '/addClub';
String getUserClubsEndpoint = getCloudFunctionsDomain() + '/getUserClubs';
String getClubEndpoint = getCloudFunctionsDomain() + '/getClub';
String addClubAnnouncementEndpoint =
    getCloudFunctionsDomain() + '/addClubAnnouncement';
String getClubAnnouncementsEndpoint =
    getCloudFunctionsDomain() + '/getClubAnnouncements';
const errorAddingClub = 'Error adding club';
const errorGettingUserClubs = 'Error getting user clubs';
const errorGettingClub = 'Error getting club';
const errorAddingClubAnnouncement = 'Error adding club announcement';
const errorGettingClubAnnouncements = 'Error getting club announcements';
