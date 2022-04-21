import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:staugustinechsnewapp/models/shared/failure/failure.dart';
import 'package:staugustinechsnewapp/models/shared/success/success.dart';
import 'package:staugustinechsnewapp/providers/notifications/consts.dart';

@Injectable()
class PushNotificationsApi {
  static Future<Either<Failure, Success>> initialize() async {
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      return const Right(
          Success(message: successInitializingPushNotifications));
    } catch (e) {
      return const Left(Failure(message: errorInitializingPushNotifications));
    }
  }

  static Future<Either<Failure, String>> getToken() async {
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      String token = await messaging.getToken() ?? '';
      return Right(token);
    } catch (e) {
      return const Left(Failure(message: errorGettingToken));
    }
  }

  static Future<Either<Failure, Success>> subscribeToTopic(
      {required String topic}) async {
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      await messaging.subscribeToTopic(topic);
      return const Right(Success(message: successSubscribedToTopic));
    } catch (e) {
      return const Left(Failure(message: errorSubscribingToTopic));
    }
  }

  static Future<Either<Failure, Success>> unsubscribeFromTopic(
      {required String topic}) async {
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      await messaging.unsubscribeFromTopic(topic);
      return const Right(Success(message: successUnsubscribedFromTopic));
    } catch (e) {
      return const Left(Failure(message: errorUnsubscribingFromTopic));
    }
  }

  static Future<Either<Failure, Success>>
      setForegroundNotificationPresentationOptions(
          {required bool enabled}) async {
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      await messaging.setForegroundNotificationPresentationOptions(
        alert: enabled,
        badge: enabled,
        sound: enabled,
      );
      return const Right(Success(
          message: successSettingForegroundNotificationPresentationOptions));
    } catch (e) {
      return const Left(Failure(
          message: errorSettingForegroundNotificationPresentationOptions));
    }
  }
}
