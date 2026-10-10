import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markti/features/profile/presentation/cubit/profile_cubit.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const CircularProgressIndicator();
            }

            if (state is ProfileFailure) {
              return Text(state.errorMessage);
            }

            if (state is ProfileSucess) {
              log(state.userModel.fullName);
              log(state.userModel.email);
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CircleAvatar(
                //   radius: 50,
                //   backgroundImage: AssetImage('assets/images/profile_picture.png'),
                // ),
                const SizedBox(height: 16),
                Text(
                  state is ProfileSucess ? state.userModel.fullName : "",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  state is ProfileSucess ? state.userModel.email : "",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                const Text(
                  'My Orders',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Settings',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Logout',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// create a appropriate  ui for profile view with a profile picture, name, email, and a list of options like "My Orders", "Settings", "Logout" etc.

// {
//     "userId": "3a430e5c-c6e7-47d5-6fef-08df0e67e8ec",
//     "email": "abdelrahmanalielgohary@gmail.com",
//     "fullName": "Abdo Ali",
//     "profilePicture": null
// }
