import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInactive extends StatelessWidget {
  const UserInactive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cliente Inactivo'),
        backgroundColor: Color.fromARGB(255, 2, 78, 92),
        elevation: 2,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold, //
        ),
      ),
      body: Center(
        child: Container(
          width: 320,
          height: 680,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 2, 78, 92).withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(0, 3), // Controla la sombra del contenedor
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://thumbs.dreamstime.com/b/icon-template-245869408.jpg',
                width: 150,
                height: 150,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(), // Agrega un indicador de carga mientras se carga la imagen
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const Text(
                'Cliente Inactivo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 2, 78, 92),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
