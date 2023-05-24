import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_itti/screens/users/status/user_locked.dart';

import '../screens/users/status/user_active.dart';
import '../screens/users/status/user_inactive.dart';

// Funcion para generar numeros aleatorios
int generateRandomNumber() {
  Random random = Random();
  return random.nextInt(100) + 1;
}

// Metodo para verificar las condiciones y ejecutar las acciones correspondientes
void checkConditions(BuildContext context) {
  int randomNumber = generateRandomNumber();
  print('Número generado: $randomNumber');

  if (randomNumber < 20) {
    print('Cliente Activo - Imprimir 1');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserActive()),
    );
    // ir a la pantalla de Cliente Activo
  } else if (randomNumber % 20 == 0) {
    print('Cliente Inactivo - Imprimir 2');

    // ir a  la pantalla de Cliente Inactivo
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserInactive()),
    );
  } else {
    print('Cliente Bloqueado - Imprimir 3');
    // ir a  la pantalla de Cliente Bloqueado
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserLocked()),
    );
  }
}
