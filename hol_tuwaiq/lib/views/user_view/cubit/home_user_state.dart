part of 'home_user_cubit.dart';

@immutable
sealed class HomeUserState {}

final class HomeUserInitial extends HomeUserState {}

final class SuceessSendState extends HomeUserState {}

final class LoadingScopesState extends HomeUserState {}

final class LoadingState extends HomeUserState {}

final class LoadSuccessDataState extends HomeUserState {}

final class ErrorState extends HomeUserState {}
