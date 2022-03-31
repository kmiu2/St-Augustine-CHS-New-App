part of 'nav_bloc.dart';

@freezed
class NavState with _$NavState {
  const factory NavState({
    @Default(true) bool navbarVisible,
  }) = _NavState;
  factory NavState.initial() => const NavState();
}
