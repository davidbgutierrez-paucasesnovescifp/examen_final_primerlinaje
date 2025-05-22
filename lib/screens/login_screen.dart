import 'package:examen_final_primerlinaje/services/preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginForm = Provider.of<LoginFormProvider>(context);
  final authService = Provider.of<PreferencesService>(context);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginForm.formKey,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUnfocus,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'john.doe@gmail.com',
              labelText: 'Correu electrònic',
              prefixIcon: Icons.alternate_email_outlined,
            ),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value!) ? null : 'No es de tipus correu';
            },
          ),
        ],
      ),
    );
  }
}
