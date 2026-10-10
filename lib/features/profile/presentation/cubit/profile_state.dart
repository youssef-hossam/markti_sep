part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileState {}
final class ProfileFailure extends ProfileState {
  final String errorMessage;
  ProfileFailure({required this.errorMessage});
}
final class ProfileSucess extends ProfileState{

  final UserModel userModel;
  ProfileSucess({required this.userModel});
}
