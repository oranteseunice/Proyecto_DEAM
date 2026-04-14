import 'package:app_social/botones/password.dart';
import 'package:flutter/material.dart';
import '../botones/button.dart';
import 'home.dart';

//Pnatalla de inicio de sesion de la aplicacion 
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //color de fondo general
      backgroundColor: const Color(0xFFF5F6F8),

      //ListView permite scroll en pantallas pequeñas
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [

          const SizedBox(height: 40),
          
          //Avatar que representa el  logo del usuario
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey.shade300,
            ),
          ),

          const SizedBox(height: 30),
          
          //Titulo Principal de la pantalla
          const Text(
            'UCAD Servicio Social',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 30, 58, 138),
            ),
          ),

          const SizedBox(height: 5),
          
          //Linea decorativa debajo del titulo
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 4,
            width: 150,
            color: const Color.fromARGB(255, 240, 180, 41),
          ),

          const SizedBox(height: 10),
          
          //texto de bienvenida
          const Text(
            'Bienvenido, por favor inicia sesión.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 30),
          
          //campo de entrada para el correo electronico
          TextField(
            decoration: InputDecoration(
              hintText: 'Correo electronico',
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              prefixIcon: const Icon(Icons.email, color: Color(0xFFF0B429)),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 20),
          
          //Etiqueta del campo contraseña
          const Text(
            'Contraseña',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 8),
          
          //campo de contraseña con ocultar/mostrar
          const PasswordField(),

          const SizedBox(height: 15),
          
          //Texto de recuperacion de contraseña
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              '¿Olvidaste tu contraseña?',
              style: TextStyle(
                color: Color(0xFF1E3A8A),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 30),
          
          //boton principal que navega a la pantalla Home
          BotonPrincipal(
            texto: 'Iniciar sesión',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home(),
                ),
              ); 
            },
          ),

          const SizedBox(height: 30),
          
          //texto de registro
          const Center(
            child: Text(
              '¿No tienes cuenta?',
              style: TextStyle(color: Colors.grey),
            ),
          ),

          const SizedBox(height: 10),

          //opcion para solicitar acceso
          const Center(
            child: Text(
              'Solicita acceso aquí →',
              style: TextStyle(
                color: Color(0xFF1E3A8A),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}