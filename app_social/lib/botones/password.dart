import 'package:flutter/material.dart';

//campo de contraseña 
class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  //variable que controla si la contraseña esta oculta o no
  bool _ocultar = true;

  @override
  Widget build(BuildContext context) {
    return TextField(

      //ocukta o muestra el texto segun su estado
      obscureText: _ocultar,
      decoration: InputDecoration(
        hintText: 'Contraseña',
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),

        //icono izquierdo
        prefixIcon: const Icon(
          Icons.lock,
          color: Color(0xFFF0B429),
        ),
        //boton para mostrar/ocultar contra
        suffixIcon: IconButton(
          icon: Icon(
            _ocultar ? Icons.visibility_off : Icons.visibility,
            color: const Color(0xFFF0B429),
          ),
          onPressed: () {
            //cambia el estado y actualiza la interfaz
            setState(() {
              _ocultar = !_ocultar;
            });
          },
        ),
        filled: true,
        fillColor: Colors.white,

        //botones del campo
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}