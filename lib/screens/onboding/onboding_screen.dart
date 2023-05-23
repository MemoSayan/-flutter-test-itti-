import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'components/animated_btn.dart';

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
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              const Spacer(),

              //header
              const SizedBox(
                width: 400,
                child: Column(
                  children: [
                    Text(
                      "Bienvenido",
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
                    Text("App de usuarios, consumiendo la API de REQRES",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Poppins",
                          height: 1.7,
                          color: Color.fromARGB(255, 5, 70, 109),
                        )),
                  ],
                ),
              ),

              const Spacer(flex: 2),

              AnimatedBtn(
                btnAnimationController: _btnAnimationController,
                press: () {
                  _btnAnimationController.isActive = true;
                },
              ),

              // footer
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text("Ingrese un usuario y contraseña para continuar",
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
        ))
      ],
    ));
  }
}
