import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    nom: json["nom"],
    cognoms: json["cognoms"],
    ciutat: json["ciutat"],
    descripcio: json["descripcio"],
    foto: json["foto"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom": nom,
    "cognoms": cognoms,
    "ciutat": ciutat,
    "descripcio": descripcio,
    "foto": foto,
  };
}
