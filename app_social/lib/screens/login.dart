import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../botones/button.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final correoController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 40),

          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey.shade300,
            ),
          ),

          const SizedBox(height: 30),

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

          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 4,
            width: 150,
            color: const Color.fromARGB(255, 240, 180, 41),
          ),

          const SizedBox(height: 10),

          const Text(
            'Bienvenido, por favor inicia sesión.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),

          const SizedBox(height: 30),

          // CORREO
          TextField(
            controller: correoController,
            decoration: InputDecoration(
              hintText: 'Correo electronico',
              prefixIcon: const Icon(Icons.email, color: Color(0xFFF0B429)),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Contraseña',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 8),

          // PASSWORD
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Contraseña',
              prefixIcon: const Icon(Icons.lock, color: Color(0xFFF0B429)),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 30),

          // BOTÓN LOGIN
          BotonPrincipal(
            texto: 'Iniciar sesión',
            onPressed: () async {
              final supabase = Supabase.instance.client;

              // VALIDAR CAMPOS
              if (correoController.text.isEmpty ||
                  passwordController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Completa todos los campos'),
                  ),
                );
                return;
              }

              try {
                final user = await supabase
                    .from('usuarios')
                    .select()
                    .eq('correo', correoController.text.trim())
                    .eq('password', passwordController.text.trim())
                    .maybeSingle();

                if (user != null) {
                  final rol = user['rol']; // 👈 AQUÍ TOMAMOS EL ROL

                  print("ROL: $rol"); // opcional

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(rol: rol), // 👈 PASAMOS EL ROL
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Correo o contraseña incorrectos'),
                    ),
                  );
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: $e'),
                  ),
                );
              }
            },
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}