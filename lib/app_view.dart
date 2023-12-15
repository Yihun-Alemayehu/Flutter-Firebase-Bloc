import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_bloc/Screens/home_screen.dart';
import 'package:flutter_firebase_bloc/Screens/welcome_screen.dart';
import 'package:flutter_firebase_bloc/blocs/authentication/authentication_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GraceLink',
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if(state.status == AuthenticationState.authenticated){
            return const HomeScreen();
          }else {
            return const WelcomeScreen();
          }
        },),
    );
  }
}