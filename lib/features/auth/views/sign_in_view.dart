import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/core/api/api_consumer.dart';
import 'package:markti/core/api/api_error_handler.dart';
import 'package:markti/features/auth/auth.dart';
import 'package:markti/features/auth/sign_in_cubit/sign_in_cubit.dart';
import 'package:markti/features/auth/widgets/castome_field_user.dart';
import 'package:markti/features/auth/widgets/custom_text_form_field.dart';
import 'package:markti/features/auth/widgets/icon_button.dart';
import 'package:markti/features/auth/widgets/skip_button.dart';

class SignInView extends StatelessWidget {
  static const String routeName = '/signIn';
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInFailure) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'Login Failed',
              desc: state.errorMessage,
              btnOkOnPress: () {
                // Navigate to the next page( Otp verification page)
              },
            ).show();
          } else if (state is SignInSuccess) {
            Navigator.pushNamed(context, '/navBar');
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(children: [
                SizedBox(
                  height: 58.h,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: SkipButton(),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Image.asset(
                  'assets/images/4x/Logo_Splash_Screen.png',
                  // width: double.infinity,
                  // height: 232.h,
                  // width: 272.w,
                ),
                SizedBox(
                  height: 32.h,
                ),
                Form(
                  child: Column(children: [
                    CustomUserField(
                      hint_text: 'Email',
                      controller: _emailController,
                      label_text: 'Email',
                      icon: Icons.email_outlined,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomUserField(
                      ispassword: true,
                      hint_text: 'Password',
                      controller: _passwordController,
                      label_text: 'Password',
                      icon: Icons.lock_outlined,
                      // isPassword: true,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      children: [
                        Transform.translate(
                          offset: Offset(-10, 0), // Adjust the offset as needed

                          // origin: ,

                          child: Checkbox(
                            // visualDensity: VisualDensity.compact,
                            // materialTapTargetSize:
                            //     MaterialTapTargetSize.shrinkWrap,
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(-20, 0), // Adjust the offset as needed
                          child: Text(
                            'Remember me',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            // Handle forgot password action
                          },
                          child: Text(
                            'Forgot Password?',
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    BlocBuilder<SignInCubit, SignInState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              fixedSize: Size(400, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                          child: state is SignInLoading
                              ? CircularProgressIndicator()
                              : Text(' Log In',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                          onPressed: () {
                            context.read<SignInCubit>().loginUser(
                                _emailController.text,
                                _passwordController.text);
                            // loginUser(
                            //   context,
                            //   _emailController.text,
                            //   _passwordController.text,
                            // );
                          },
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SocialIconButton(
                          icon_social: google,
                        ),
                        SocialIconButton(
                          icon_social: apple,
                        ),
                        SocialIconButton(
                          icon_social: facebook,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Are you new in Marketi?",
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(
                          width: 0.w,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
