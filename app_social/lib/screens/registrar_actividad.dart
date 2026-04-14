import 'dart:io';
import 'package:flutter/material.dart';

import 'home.dart';
import 'mis_horas.dart';
import 'perfil.dart';

class RegistrarActividad extends StatefulWidget {
  const RegistrarActividad({super.key});

  @override
  State<RegistrarActividad> createState() => _RegistrarActividadState();
}

class _RegistrarActividadState extends State<RegistrarActividad> {

  File? archivoSeleccionado;
  final TextEditingController comentarioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2E4A9E),
        title: const Text("Subir evidencia"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 20),

            const Text(
              "Sube evidencia de la actividad realizada",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            // comentario
            TextField(
              controller: comentarioController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Comentario (opcional)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // botón simulado
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  archivoSeleccionado = File("evidencia.pdf");
                });
              },
              icon: const Icon(Icons.attach_file),
              label: const Text("Subir archivo"),
            ),

            const SizedBox(height: 20),

            // mostrar archivo
            if (archivoSeleccionado != null)
              const Text(
                "Archivo: evidencia.pdf",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

            const SizedBox(height: 30),

            // botón enviar
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E4A9E),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              onPressed: () {
                if (archivoSeleccionado == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Debes subir un archivo")),
                  );
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Enviado correctamente")),
                );
              },
              child: const Text("Enviar"),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFFFFC107),
        currentIndex: 0,
        onTap: (index) {

          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          }

          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MisHoras()),
            );
          }

          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Perfil()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.access_time), label: "Mis horas"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}