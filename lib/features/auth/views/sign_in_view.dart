import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markti/features/auth/widgets/custom_text_form_field.dart';
import 'package:markti/features/auth/widgets/icon_button.dart';
import 'package:markti/features/auth/widgets/skip_button.dart';

class SignInView extends StatelessWidget {
  static const String routeName = '/signIn';
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                  CustomTextFormField(
                    labelText: 'Email',
                    icon: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    labelText: 'Password',
                    icon: Icons.lock_outlined,
                    isPassword: true,
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
                          style: TextStyle(fontSize: 14.sp, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        fixedSize: Size(400, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    child: Text(' Log In',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    onPressed: () {
                      // Navigate to the next page
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
    );
  }
}
