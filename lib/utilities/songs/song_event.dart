part of 'song_bloc.dart';

@freezed
class SongEvent with _$SongEvent {
  const factory SongEvent.getSongs() = _getSongs;
  const factory SongEvent.addSong(
      {required String creatorEmail,
      required String artist,
      required String name}) = _addSong;
  const factory SongEvent.deleteSong({required String id}) = _deleteSong;
  const factory SongEvent.upvoteSong(
      {required String id, required int upvotes}) = _upvoteSong;
  const factory SongEvent.setUpvoted({required Map<String, dynamic> upvoted}) =
      _setUpvoted;
  const factory SongEvent.resetSongs() = _resetSongs;
  const factory SongEvent.resetFailSuccess() = _resetFailSuccess;
}
