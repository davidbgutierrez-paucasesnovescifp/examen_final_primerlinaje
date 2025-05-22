import 'package:examen_final_primerlinaje/providers/providers.dart';
import 'package:examen_final_primerlinaje/services/users_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<UserFormProvider>(context);
    final userService = Provider.of<UsersService>(context);
    ;
    return Form(
      key: loginForm.formKey,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUnfocus,

            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 5) {
                return "Nombre de usuario corto";
              }
              return null;
            },
          ),
          TextFormField(
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUnfocus,
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 8) {
                return "La contraseña tiene que tener mínimo 8 caracteres";
              }
              return null;
            },
          ),
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

                      loginForm.isLoading = false;

                      if (loginForm.error != false) {
                        // Limpiamos el form
                        loginForm.email = '';
                        loginForm.password = '';
                      }
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
          Checkbox(
            checkColor: Colors.white,
            value: loginForm.isChecked,
            onChanged: (bool? value) {},
          ),
        ],
      ),
    );
  }
}
