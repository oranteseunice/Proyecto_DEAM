import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CrearUsuario extends StatefulWidget {
  const CrearUsuario({super.key});

  @override
  State<CrearUsuario> createState() => _CrearUsuarioState();
}

class _CrearUsuarioState extends State<CrearUsuario> {
  final supabase = Supabase.instance.client;

  final nombreController = TextEditingController();
  final correoController = TextEditingController();
  final passwordController = TextEditingController();
  final rolController = TextEditingController();

  Future<void> crearUsuario() async {
    if (nombreController.text.isEmpty ||
        correoController.text.isEmpty ||
        passwordController.text.isEmpty ||
        rolController.text.isEmpty) {
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Completa todos los campos")),
      );
      return;
    }

    try {
      await supabase.from('usuarios').insert({
        'nombre': nombreController.text.trim(),
        'correo': correoController.text.trim(),
        'password': passwordController.text.trim(),
        'rol': rolController.text.trim(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuario creado correctamente")),
      );

      Navigator.pop(context); // regresar al panel admin
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear usuario"),
        backgroundColor: const Color(0xFF2E4A9E),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: "Nombre",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: correoController,
              decoration: const InputDecoration(
                labelText: "Correo",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Contraseña",
              ),
              obscureText: true,
            ),

            const SizedBox(height: 15),

            TextField(
              controller: rolController,
              decoration: const InputDecoration(
                labelText: "Rol (admin o estudiante)",
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E4A9E),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              onPressed: crearUsuario,
              child: const Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}