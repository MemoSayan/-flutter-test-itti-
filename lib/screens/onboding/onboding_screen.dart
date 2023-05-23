import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rive/rive.dart';

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
        body: Stack(
      // Agregamos la animacion de rive con la ayuda de la libreria rive
      children: [
        Positioned(
            // height: 100,
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 250,
            left: 120,
            child: Image.asset("assets/Backgrounds/Spline.png")),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 10,
            ),
            child: const SizedBox(),
          ),
        ),
        const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 20,
            ),
            child: const SizedBox(),
          ),
        ),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              const SizedBox(
                width: 400,
                child: Column(
                  children: [
                    Text(
                      "Bienvenido a ITTI",
                      style: TextStyle(
                        fontSize: 50,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        //color: Color.fromARGB(255, 241, 94, 2),
                        color: Color.fromARGB(255, 5, 70, 109),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Ingrese un usuario y contraseña para continuar",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Poppins",
                          height: 1.7,
                          color: Color.fromARGB(255, 5, 70, 109),
                        )),
                  ],
                ),
              ),
              AnimatedBtn(
                btnAnimationController: _btnAnimationController,
                press: () {
                  _btnAnimationController.isActive = true;
                },
              )
            ],
          ),
        ))
      ],
    ));
  }
}

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    super.key,
    required RiveAnimationController btnAnimationController,
    required this.press,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
          height: 64,
          width: double.infinity,
          child: Stack(
            children: [
              RiveAnimation.asset(
                "assets/RiveAssets/button.riv",
                controllers: [_btnAnimationController],
              ),
              const Positioned.fill(
                top: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.arrow_right_circle_fill,
                      color: Color.fromARGB(255, 238, 79, 129),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Iniciar Sesión",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
