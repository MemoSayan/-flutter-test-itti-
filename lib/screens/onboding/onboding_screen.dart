import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'components/animated_btn.dart';
import 'components/custom_sign_in_dialog.dart';

/*
 * @autor: Guillermo De la cruz  
 * @since: 22/05/2023
 * 
 */

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSignInDialog = false;
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active");
    autoplay:
    false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        body: Stack(
      // Agregamos la animacion de rive con la ayuda de la libreria rive
      children: [
        Positioned(
            height: 100,
            width: MediaQuery.of(context).size.width,
            bottom: 200,
            left: 120,
            child: Image.asset("assets/Backgrounds/Spline.png")),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 20,
            ),
            child: const SizedBox(),
          ),
        ),
        const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 25,
              sigmaY: 25,
            ),
            child: const SizedBox(),
          ),
        ),
        AnimatedPositioned(
          top: isSignInDialog ? -60 : 0,
          duration: const Duration(milliseconds: 200),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                const Spacer(),

                //header
                const SizedBox(
                  width: 300,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "Bienvenido",
                          style: TextStyle(
                            fontSize: 45,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            //color: Color.fromARGB(255, 241, 94, 2),
                            color: Color.fromARGB(255, 5, 70, 109),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text("App de usuarios, consumiendo la API de REQRES",
                            style: TextStyle(
                              fontSize: 26,
                              fontFamily: "Poppins",
                              height: 1.7,
                              color: Color.fromARGB(255, 5, 70, 109),
                            )),
                      ],
                    ),
                  ),
                ),

                const Spacer(flex: 1),

                AnimatedBtn(
                  btnAnimationController: _btnAnimationController,
                  press: () {
                    _btnAnimationController.isActive = true;
                    Future.delayed(const Duration(milliseconds: 800), () {
                      setState(() {
                        isSignInDialog = true;
                      });
                      // Navigator.pushNamed(context, "/home");
                    });
                    customDialog(context, onClosed: (_) {
                      setState(() {
                        isSignInDialog = false;
                      });
                    });
                  },
                ),

                // footer
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text("",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Poppins",
                        height: 1.7,
                        color: Color.fromARGB(255, 5, 70, 109),
                      )),
                ),
              ],
            ),
          )),
        )
      ],
    ));
  }
}
