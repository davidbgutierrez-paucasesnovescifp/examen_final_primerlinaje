// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

List<User> userFromMap(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromMap(x)));

String userToMap(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class User {
  int id;
  String nom;
  String cognoms;
  String ciutat;
  String descripcio;
  String foto;

  User({
    required this.id,
    required this.nom,
    required this.cognoms,
    required this.ciutat,
    required this.descripcio,
    required this.foto,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["id"],
    nom: json["nom"],
    cognoms: json["cognoms"],
    ciutat: json["ciutat"],
    descripcio: json["descripcio"],
    foto: json["foto"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nom": nom,
    "cognoms": cognoms,
    "ciutat": ciutat,
    "descripcio": descripcio,
    "foto": foto,
  };

  User copy() => this;
}
