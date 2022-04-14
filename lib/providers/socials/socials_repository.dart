import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:staugustinechsnewapp/models/shared/failure/failure.dart';
import 'package:staugustinechsnewapp/models/socials/club/club.dart';
import 'package:staugustinechsnewapp/providers/socials/socials_api.dart';

@lazySingleton
class SocialsRepository {
  SocialsRepository();

  static Future<Either<Failure, Club>> addClub({
    required String description,
    required String email,
    required int joinPreference,
    required String name,
    required String pictureId,
  }) async {
    return await SocialsApi.addClub(
        name: name,
        description: description,
        email: email,
        pictureId: pictureId,
        joinPreference: joinPreference);
  }
}
