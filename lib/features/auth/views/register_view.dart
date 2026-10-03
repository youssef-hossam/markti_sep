import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/features/auth/widgets/button_widget.dart';
import 'package:markti/features/auth/widgets/castome_field_user.dart';
import 'package:markti/features/auth/widgets/icon_button.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _first_nameController = TextEditingController();
  final TextEditingController _last_nameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    const Color mainBlue = Color(0xFF3F84FF);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 0,
          ),
          // SingleChildScrollView accepts only ONE child, so we use one Column
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button + Logo on the same level
              Stack(
                children: [
                  // Logo (fills the width, so it stays in the center)
                  Center(
                    child: Image.asset(
                      'assets/images/4x/Logo_Splash_Screen.png',
                      width: 220.w,
                      // height: 90.h,
                    ),
                  ),

                  // Back Button (stays at the top-left by default)
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFC9D8F5),
                        width: 1.5.w,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.chevron_left,
                        color: mainBlue,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 5.h,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "fullname",
                      style: TextStyle(fontSize: 18),
                    ),

                    // Your Name
                    CustomUserField(
                      controller: _first_nameController,
                      label_text: "Your Name",
                      hint_text: "Full Name",
                      icon: Icons.person_outline,
                    ),

                    SizedBox(
                      height: 7.h,
                    ),

                    // Username
                    Text(
                      "Username",
                      style: TextStyle(fontSize: 18),
                    ),
                    CustomUserField(
                      controller: _last_nameController,
                      label_text: "Username",
                      hint_text: "Username",
                      icon: Icons.person_outline,
                    ),

                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      "PhoneNumber",
                      style: TextStyle(fontSize: 18),
                    ),
                    // Phone Number
                    CustomUserField(
                      label_text: "Phone Number",
                      hint_text: "Your Phone",
                      icon: Icons.phone_android,
                    ),

                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(fontSize: 18),
                    ),

                    // Email
                    CustomUserField(
                      controller: _emailController,
                      label_text: "Email",
                      hint_text: "You@gmail.com",
                      icon: Icons.mail_outline,
                      validator: (value) {
                        // validation logic for email
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (value.contains('@') == false ||
                            value.contains('.') == false) {
                          return 'Please enter a valid email';
                        }
                      },
                    ),

                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(fontSize: 18),
                    ),

                    // Password
                    CustomUserField(
                      controller: _passwordController,
                      label_text: "Password",
                      hint_text: "Password",
                      icon: Icons.lock_outline,
                      ispassword: true,
                      validator: (value) {
                        // validation logic for password
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                          return 'Password must contain at least one uppercase letter';
                        } else if (!RegExp(r'[a-z]').hasMatch(value)) {
                          return 'Password must contain at least one lowercase letter';
                        } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                          return 'Password must contain at least one number';
                        } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                            .hasMatch(value)) {
                          return 'Password must contain at least one special character';
                        }
                      },
                    ),

                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      "Confirm Password",
                      style: TextStyle(fontSize: 18),
                    ),

                    // Confirm Password
                    CustomUserField(
                      controller: _confirmPasswordController,
                      label_text: "Confirm Password",
                      hint_text: "Confirm Password",
                      icon: Icons.lock_outline,
                      ispassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        } else if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 14.h,
              ),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: CustomElevatedButton(
                  text: "Sign Up",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      registerUser();
                    }
                  },
                ),
              ),

              SizedBox(
                height: 8.h,
              ),

              // Or Continue With
              Center(
                child: Text(
                  "Or Continue With",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
              ),

              SizedBox(
                height: 2.h,
              ),

              // Social Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
            ],
          ),
        ),
      ),
    );
  }

  //
  Future<void> registerUser() async {
    try {
      Response response = await Dio().post(
          'https://accessories-eshop.runasp.net/api/auth/register',
          data: {
            "email": _emailController.text,
            "password": _passwordController.text,
            "firstName": _first_nameController.text,
            "lastName": _last_nameController.text
          });
      print(response.data);
      print('Response data From Api :${response.statusCode}');

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
      )..show();
    } on DioException catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'Registration Failed',
        desc:
            '${e.message}',
        // btnCancelOnPress: () {},
        btnOkOnPress: () {
          // Navigate to the next page( Otp verification page)
        },
      )..show();
      // TODO
    }
  }
}
