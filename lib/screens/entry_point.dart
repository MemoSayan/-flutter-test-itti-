import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import '../services/check_user_status.dart';
import '../services/service.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EntryPointState createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  final UserService _userService = UserService();
  List<dynamic> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      final users = await _userService.getUsers();
      setState(() {
        _users = users;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "List ReqRes users",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Backgrounds/Spline.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(
                color: Color.fromARGB(144, 226, 226, 226).withOpacity(
                    0.5), // Ajusta la opacidad según tus necesidades
              ),
            ),
          ),
          ListView.builder(
            itemCount: _users.length,
            itemBuilder: (context, index) {
              final user = _users[index];
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      checkConditions(context);
                    },
                    title: Text(user['first_name'] + ' ' + user['last_name']),
                    subtitle: Text(
                      user['email'],
                      style: const TextStyle(
                        color: Color.fromARGB(221, 97, 25, 241),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user['avatar']),
                    ),
                  ),
                  Divider(
                    height:
                        5, // Ajusta la altura del separador según tus necesidades
                    color: Color.fromARGB(125, 250, 250,
                        250), // Ajusta el color del separador según tus necesidades
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
