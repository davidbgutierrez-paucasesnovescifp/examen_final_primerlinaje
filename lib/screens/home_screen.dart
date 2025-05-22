import 'package:examen_final_primerlinaje/models/User.dart';
import 'package:examen_final_primerlinaje/services/users_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UsersService>(context);
    userService.loadUsers();
    return Scaffold(
      appBar: AppBar(title: const Text('Usuaris')),
      body: ListView.builder(
        itemCount: userService.userList.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          child: UserCard(user: userService.userList[index]),
          onTap: () {
            userService.selectedUser = userService.userList[index].copy();
            Navigator.of(context).pushNamed('user');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          userService.selectedUser = new User(
            id: userService.userList.length + 1,
            nom: "",
            cognoms: "",
            ciutat: "",
            descripcio: "",
            foto: "",
          );
          Navigator.of(context).pushNamed('user');
        },
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        child: _UserDetails(name: user.nom, id: user.id.toString()),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(color: Colors.black12, offset: Offset(0, 7), blurRadius: 10),
    ],
  );
}

class _UserDetails extends StatelessWidget {
  final String name;
  final String? id;
  const _UserDetails({Key? key, required this.name, required this.id})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        width: double.infinity,
        height: 80,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              id ?? "",
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Colors.indigo,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(25),
      topRight: Radius.circular(25),
    ),
  );
}
