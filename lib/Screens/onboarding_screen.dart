import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Register',
        finishButtonStyle: const FinishButtonStyle(
          backgroundColor: Colors.black,
        ),
        skipTextButton: const Text('Skip'),
        trailing: const Text('Login'),
        background: [
          Image.asset('assets/slide_1.png'),
          Image.asset('assets/slide_2.png'),
          Image.asset('assets/slide_3.png'),
        ],
        totalPage: 3,
        speed: 2.8,
        pageBodies: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              children: [
                SizedBox(
                  height: 480,
                ),
                Text('Description Text 1'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              children:[
                SizedBox(
                  height: 480,
                ),
                Text('Description Text 2'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              children: [
                SizedBox(
                  height: 480,
                ),
                Text('Description Text 3'),
              ],
            ),
          ),
        ],
        //centerBackground: true,
      ),
    );
  }
}
