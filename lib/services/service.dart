import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
//get list of users
  Future<List<dynamic>> getUsers() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final userList = jsonData['data'];

      return userList;
    } else {
      throw Exception('Error en la petición: ${response.statusCode}');
    }
  }
}
