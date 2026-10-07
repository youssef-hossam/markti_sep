import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:markti/core/api/api_consumer.dart';

Future<void> registerUser(String email, String password, String firstName,
    String lastName, BuildContext context) async {
  ApiConsumer apiConsumer = ApiConsumer(dio: Dio());
  Either<String, dynamic> result =
      await apiConsumer.post('/api/auth/register', data: {
    "email": email,
    "password": password,
    "firstName": firstName,
    "lastName": lastName
  });

  result.fold((l) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'Registration Failed',
      desc: l,
      // btnCancelOnPress: () {},
      btnOkOnPress: () {
        // Navigate to the next page( Otp verification page)
      },
    ).show();
  }, (r) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.rightSlide,
      title: 'Registration Successful',
      desc:
          'an otp is sent to your email inbox please use it to verify your email ',
      // btnCancelOnPress: () {},
      btnOkOnPress: () {
        // Navigate to the next page( Otp verification page)
      },
    ).show();
  });


}

