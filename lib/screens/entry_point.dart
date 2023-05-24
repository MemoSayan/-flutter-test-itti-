import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

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
      // Manejar el error de la petición
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
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            title: Text(user['first_name']),
            subtitle: Text(user['email']),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user['avatar']),
            ),
          );
        },
      ),
    );
  }
}
