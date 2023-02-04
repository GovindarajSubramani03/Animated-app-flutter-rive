import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:rive/rive.dart';

import '../../components/animatedbtn.dart';
import '../../components/custom_signin.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSignInShow = false;
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    super.initState();
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 100,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isSignInShow ? -50 : 0,
            duration: const Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children: const [
                          Text(
                            "Learn design & code",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 60,
                                height: 1.2),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. A blandit sapien lacus sed metus. Nunc lacinia diam turpis, nec lobortis libero luctus ut. Integer id nisi gravida, malesuada dui in, gravida metus.")
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Animatedbtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;
                        Future.delayed(const Duration(milliseconds: 950), () {
                          setState(() {
                            isSignInShow = true;
                          });
                          customSigninmethod(
                            context,
                            onClosed: (_) {
                              isSignInShow = false;
                            },
                          );
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 35,
                      ),
                      child: Text(
                          "Cras ac orci ac justo tincidunt blandit suscipit nec augue. Phasellus in quam turpis. Aenean interdum orci in mauris condimentum, lacinia faucibus ipsum egestas."),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
