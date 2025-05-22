import 'dart:math';

import 'package:examen_final_primerlinaje/classes/sharedPrefs.dart';
import 'package:examen_final_primerlinaje/providers/providers.dart';
import 'package:examen_final_primerlinaje/services/services.dart';
import 'package:examen_final_primerlinaje/ui/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Container(padding: EdgeInsets.all(40), child: _LoginForm()),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUnfocus,
            keyboardType: TextInputType.emailAddress,
            initialValue: SharedPrefs.name,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'john.doe@gmail.com',
              labelText: 'Correu electrònic',
              prefixIcon: Icons.alternate_email_outlined,
            ),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 5) {
                return "Nombre de usuario corto";
              }
              return null;
            },
          ),
          SizedBox(height: 30),
          TextFormField(
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUnfocus,
            keyboardType: TextInputType.visiblePassword,
            initialValue: SharedPrefs.password != ""
                ? SharedPrefs.password
                : null,
            decoration: InputDecorations.authInputDecoration(
              hintText: '******',
              labelText: 'Contrasenya',
              prefixIcon: Icons.lock_outline,
            ),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 8) {
                return "La contraseña tiene que tener mínimo 8 caracteres";
              }
              return null;
            },
          ),
          SizedBox(height: 30),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.deepPurple,
            onPressed: loginForm.isLoading
                ? null
                : () async {
                    // Deshabilitam el teclat
                    FocusScope.of(context).unfocus();

                    if (loginForm.isValidForm()) {
                      loginForm.isLoading = true;

                      if (loginForm.error != false) {
                        // Limpiamos el form
                        loginForm.email = '';
                        loginForm.password = '';
                      }
                      if (loginForm.isChecked) {
                        SharedPrefs.name = loginForm.email;
                        SharedPrefs.password = loginForm.password;
                      }
                      Navigator.pushNamed(context, "home");
                      loginForm.isLoading = false;
                    }
                  },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(
                loginForm.isLoading ? 'Esperi' : 'Iniciar sessió',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.white,
                value: loginForm.isChecked,
                onChanged: (value) {
                  if (value != null) {
                    loginForm.changePreferences(value);
                  }
                },
              ),
              Text("Recordar"),
            ],
          ),
        ],
      ),
    );
  }
}
