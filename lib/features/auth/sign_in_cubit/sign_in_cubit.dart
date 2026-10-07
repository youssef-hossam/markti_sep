import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:markti/core/api/api_consumer.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  loginUser(String email, String password) async {
    emit(SignInLoading());

    ApiConsumer apiConsumer = ApiConsumer(dio: Dio());
    Either<String, dynamic> result =
        await apiConsumer.post('/api/auth/login', data: {
      "email": email,
      "password": password,
    });

    result.fold((l) {
      emit(SignInFailure(errorMessage: l));
    }, (r) {
      emit(SignInSuccess());
    });
  }
}
