import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserLocked extends StatelessWidget {
  const UserLocked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cliente Bloqueado'),
        backgroundColor: Color.fromARGB(255, 179, 147, 249),
        elevation: 2, // Añade una sombra sutíl
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
                color:
                    const Color.fromARGB(255, 179, 147, 249).withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://cdn-icons-png.flaticon.com/512/566/566759.png',
                width: 150,
                height: 150,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const Text(
                'Cliente Bloqueado',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 179, 147, 249),
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
