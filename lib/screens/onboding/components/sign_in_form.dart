import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset("assets/icons/user-signin.svg",
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
              padding: const EdgeInsets.only(top: 10, bottom: 0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset("assets/icons/lock-security.svg",
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
              padding: const EdgeInsets.only(top: 15, bottom: 1),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 71, 117),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                icon: Icon(CupertinoIcons.arrow_right_circle_fill),
                label: Text("Ingresar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
