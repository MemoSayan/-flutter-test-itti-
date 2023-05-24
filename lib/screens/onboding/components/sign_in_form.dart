import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_itti/screens/entry_point.dart';
import 'package:rive/rive.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isshowLoading = false;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  StateMachineController? getRivecontroller(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    return controller!;
  }

  void signIn(BuildContext context) {
    setState(() {
      isshowLoading = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        check.fire();
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            isshowLoading = false;
          });
          Future.delayed(
            const Duration(seconds: 1),
            () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EntryPoint(),
                  ));
            },
          );

          //al cerrar el dialogo se activa la animacion de confetti
        });
      } else {
        error.fire();
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            isshowLoading = false;
          });
        });
      }
    });
    //Navigator.pushNamed(context, "/home");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "El campo usuario no puede estar vacio";
                            }

                            if (value.contains(RegExp(r'\d'))) {
                              return "El campo usuario no puede contener caracteres numéricos";
                            }
                            return null;
                          },
                          onSaved: (user) {},
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                                RegExp(r'\d')), // Denegar caracteres numéricos
                          ],
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SvgPicture.asset(
                                  "assets/icons/user-signin.svg",
                                  width: 15),
                            ),
                            labelText: "usuario",
                            hintText: "Ingresa tu usuario",
                          ),
                          textInputAction: TextInputAction
                              .done, // Desactiva la opción de entrada de voz
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "El campo contraseña no puede estar vacio";
                            }
                            if (value.length < 5 || value.length > 5) {
                              return "La contraseña debe tener 5 caracteres";
                            }

                            return null;
                          },
                          onSaved: (password) {},
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: SvgPicture.asset(
                                  "assets/icons/lock-security.svg",
                                  width: 15),
                            ),
                            labelText: "contraseña",
                            hintText: "Ingresa tu contraseña",
                          ),
                          textInputAction: TextInputAction
                              .done, // Desactiva la opción de entrada de voz
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            signIn(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 71, 117),
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          icon: const Icon(
                              CupertinoIcons.arrow_right_circle_fill),
                          label: const Text("Ingresar"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          isshowLoading
              ? CustomPositioned(
                  child: RiveAnimation.asset(
                    "assets/RiveAssets/check.riv",
                    onInit: (Artboard) {
                      StateMachineController? controller =
                          getRivecontroller(Artboard);
                      check = controller!.findSMI("Check") as SMITrigger;
                      error = controller.findSMI("Error") as SMITrigger;
                      reset = controller.findSMI("Reset") as SMITrigger;
                    },
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, required this.child, this.size = 100});

  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
