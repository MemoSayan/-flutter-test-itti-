import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../services/service.dart';

class UserActive extends StatelessWidget {
  const UserActive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cliente Activo'),
        backgroundColor: const Color.fromARGB(255, 11, 215, 133),
        elevation: 2,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
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
                color: const Color.fromARGB(255, 16, 217, 127).withOpacity(0.3),
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
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Facebook_Like_button.svg/2048px-Facebook_Like_button.svg.png',
                width: 200,
                height: 200,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const Text(
                'Cliente activo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 11, 215, 133),
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
