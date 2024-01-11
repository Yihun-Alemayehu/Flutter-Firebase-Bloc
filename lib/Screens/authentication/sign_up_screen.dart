import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_bloc/Screens/authentication/sign_in_screen.dart';
import 'package:flutter_firebase_bloc/blocs/sign_up/sign_up_bloc.dart';
import 'package:flutter_firebase_bloc/blocs/sign_up/sign_up_state.dart';
import 'package:flutter_firebase_bloc/components/strings.dart';
import 'package:flutter_firebase_bloc/components/textfield.dart';
import 'package:user_repository/user_repository.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? _errorMsg;
  bool obscurePassword = true;
  IconData iconPassword = CupertinoIcons.eye_fill;
  final nameController = TextEditingController();
  bool signUpRequired = false;

  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsNumber = false;
  bool containsSpecialChar = false;
  bool contains8Length = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          setState(() {
            signUpRequired = false;
          });
        } else if (state is SignUpProcess) {
          setState(() {
            signUpRequired = true;
          });
        } else {
          setState(() {
            _errorMsg = 'Sign Up failed';
          });
        }
      },
      child: Form(
        key: _formKey,
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(CupertinoIcons.mail_solid),
              errorMsg: _errorMsg,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Please fill the field';
                } else if (!emailRexExp.hasMatch(val)) {
                  return 'Please enter a valid email ';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: MyTextField(
              controller: passwordController,
              hintText: 'password',
              obscureText: obscurePassword,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(CupertinoIcons.lock_fill),
              //errorMsg: _errorMsg,
              onChanged: (val) {
                if (val!.contains(RegExp(r'[A-Z]'))) {
                  setState(() {
                    containsUpperCase = true;
                  });
                } else {
                  setState(() {
                    containsUpperCase = false;
                  });
                }
                if (val.contains(RegExp(r'[a-z]'))) {
                  setState(() {
                    containsLowerCase = true;
                  });
                } else {
                  setState(() {
                    containsLowerCase = false;
                  });
                }
                if (val.contains(RegExp(r'[0-9]'))) {
                  setState(() {
                    containsNumber = true;
                  });
                } else {
                  setState(() {
                    containsNumber = false;
                  });
                }
                if (val.contains(specialCharRexExp)) {
                  setState(() {
                    containsSpecialChar = true;
                  });
                } else {
                  setState(() {
                    containsSpecialChar = false;
                  });
                }
                if (val.length >= 8) {
                  setState(() {
                    contains8Length = true;
                  });
                } else {
                  setState(() {
                    contains8Length = false;
                  });
                }
                return null;
              },
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                    if (obscurePassword) {
                      iconPassword = CupertinoIcons.eye_fill;
                    } else {
                      iconPassword = CupertinoIcons.eye_slash_fill;
                    }
                  });
                },
                icon: Icon(iconPassword),
              ),
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Please fill the field';
                }
                // else if (!emailRexExp.hasMatch(val)) {
                //   return 'Please enter a valid email ';
                // }
                return null;
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "⚈  1 uppercase",
                    style: TextStyle(
                      color: containsUpperCase ? Colors.green : Colors.black,
                    ),
                  ),
                  Text(
                    "⚈  1 lowercase",
                    style: TextStyle(
                      color: containsLowerCase ? Colors.green : Colors.black,
                    ),
                  ),
                  Text(
                    "⚈  1 number",
                    style: TextStyle(
                      color: containsNumber ? Colors.green : Colors.black,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "⚈  1 special character",
                    style: TextStyle(
                        color:
                            containsSpecialChar ? Colors.green : Colors.black),
                  ),
                  Text(
                    "⚈  8 minimum character",
                    style: TextStyle(
                      color: contains8Length ? Colors.green : Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyTextField(
                controller: nameController,
                hintText: 'Name',
                obscureText: false,
                keyboardType: TextInputType.name,
                prefixIcon: const Icon(CupertinoIcons.person_fill),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please fill in this field';
                  } else if (val.length > 30) {
                    return 'Name too long';
                  }
                  return null;
                }),
          ),
          const SizedBox(
            height: 30,
          ),
          !signUpRequired
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          MyUser myUser = MyUser.empty;
                          myUser = myUser.copyWith(
                              email: emailController.text,
                              name: nameController.text);

                          setState(() {
                            context.read<SignUpBloc>().add(SignUpRequired(
                                role: 'user',
                                user: myUser,
                                password: passwordController.text));
                            // MaterialPageRoute(
                            //   builder: (context) => const SignInScreen(),
                            // );
                          });
                        }
                      },
                      style: TextButton.styleFrom(
                          elevation: 3,
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          )),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                )
              : const CircularProgressIndicator(),
        ]),
      ),
    );
  }
}
