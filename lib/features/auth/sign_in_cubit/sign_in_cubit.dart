import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:markti/core/api/api_consumer.dart';
import 'package:markti/core/utils/cache/cache_constants.dart';
import 'package:markti/core/utils/cache/cache_helper.dart';
import 'package:markti/features/auth/models/sign_in_response_model.dart';

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
    }, (r) async {
      SignInResponseModel signInResponseModel = SignInResponseModel.fromJson(r);
      log('Access Token: ${signInResponseModel.accessToken}');
      await CacheHelper.setSecureData(
          key: CacheConstants.accessToken,
          value: signInResponseModel.accessToken);
      CacheHelper.set(key: CacheConstants.registerStatus, value: true);
      // String? accessToken =
      //     await CacheHelper.getSecureData(key: CacheConstants.accessToken);

      // log('Access Token: $accessToken');

      emit(SignInSuccess());
    });
  }
}
