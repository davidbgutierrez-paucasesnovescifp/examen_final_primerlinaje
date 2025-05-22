import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import '../models/models.dart';
import 'package:http/http.dart' as http;

class UsersService extends ChangeNotifier {
  List<User> userList = [];
  final uri = Uri.https("ca9e0b745361bae287b7.free.beeceptor.com", 'api/dbgc/');
  User? selectedUser;
  Future loadUsers() async {
    var response = await http.get(uri);
    if (response.statusCode != 200) {
      return;
    }
    final Map<String, dynamic> usersMap = json.decode(response.body);
    usersMap.forEach((key, value) {
      final user = User.fromMap(value);
      userList.add(user);
    });
    notifyListeners();
  }
}
