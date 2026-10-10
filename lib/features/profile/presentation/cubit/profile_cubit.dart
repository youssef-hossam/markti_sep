import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:markti/core/api/api_consumer.dart';
import 'package:markti/features/profile/models/user_model.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  ApiConsumer apiConsumer = ApiConsumer(dio: Dio());

  getUserData() async {
    print("  انا ف جت يوزر هناااااااااااااااااااااا");
    emit(ProfileLoading());
    Either<String, dynamic> result = await apiConsumer.get('/api/auth/me', );

    result.fold((l) {
      emit(ProfileFailure(errorMessage: l));
    }, (r) {
      UserModel user = UserModel.fromJson(r);

      emit(ProfileSucess(userModel: user));
    });
  }
}
