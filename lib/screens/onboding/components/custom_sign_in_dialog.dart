import 'package:flutter/material.dart';
import 'package:login_itti/screens/onboding/components/sign_in_form.dart';

Future<Object?> customDialog(BuildContext context,
    {required ValueChanged onClosed}) {
  // ignore: unused_local_variable
  bool isSignInDialog = false;
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Ingresar",
    context: context,
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (_, animation, __, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
        child: child,
      );
    },
    pageBuilder: (context, _, __) => Center(
      child: Container(
        height: 720,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
        ),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Text(
                "Inicio de Sesión",
                style: TextStyle(fontSize: 37, fontFamily: "poppins"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text("Hola de nuevo, ingresa tus datos.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Poppins",
                      height: 1.7,
                      color: Color.fromARGB(255, 5, 70, 109),
                    )),
              ),
              SignInForm(),
            ],
          ),
        ),
      ),
    ),
  ).then((onClosed));
}
