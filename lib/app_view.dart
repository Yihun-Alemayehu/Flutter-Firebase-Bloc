import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_bloc/Screens/authentication/sign_in_screen.dart';
import 'package:flutter_firebase_bloc/Screens/home_screen.dart';
import 'package:flutter_firebase_bloc/Screens/onboarding_screen.dart';
import 'package:flutter_firebase_bloc/Screens/welcome_screen.dart';
import 'package:flutter_firebase_bloc/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_firebase_bloc/blocs/get_post/get_post_bloc.dart';
import 'package:flutter_firebase_bloc/blocs/my_user/my_user_bloc.dart';
import 'package:flutter_firebase_bloc/blocs/sign_in/sign_in_bloc.dart';
import 'package:flutter_firebase_bloc/blocs/update_user_info/update_user_info_bloc.dart';
import 'package:post_repository/post_repository.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  //final AuthenticationBloc signInBloc = AuthenticationBloc(myUserRepository: myUserRepository)
  @override
  Widget build(BuildContext context) {
    // final SignInBloc _signInBloc =
    //     SignInBloc(myUserRepository: context.read().add());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GraceLink',
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => SignInBloc(
                      myUserRepository:
                          context.read<AuthenticationBloc>().userRepository),
                ),
                BlocProvider(
                  create: (context) => UpdateUserInfoBloc(
                      myUserRepository:
                          context.read<AuthenticationBloc>().userRepository),
                ),
                BlocProvider(
                  create: (context) => MyUserBloc(
                      myUserRepository:
                          context.read<AuthenticationBloc>().userRepository)
                    ..add(GetMyUser(
                        myUserId: context
                            .read<AuthenticationBloc>()
                            .state
                            .user!
                            .uid)),
                ),
                BlocProvider(
                  create: (context) =>
                      GetPostBloc(myPostRepository: FirebasePostRepository())
                        ..add(
                          GetPost(),
                        ),
                ),
              ],
              child: const HomeScreen(),
            );
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}
