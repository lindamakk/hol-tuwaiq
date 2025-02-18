part of 'home_admin_cubit.dart';

@immutable
sealed class HomeAdminState {}

final class HomeAdminInitial extends HomeAdminState {}

final class LoadingState extends HomeAdminState {}

final class LoadDataState extends HomeAdminState {}

final class ErrorState extends HomeAdminState {}
