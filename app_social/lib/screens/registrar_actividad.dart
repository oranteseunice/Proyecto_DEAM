import 'dart:io';
import 'package:flutter/material.dart';

import 'home.dart';
import 'mis_horas.dart';
import 'perfil.dart';

class RegistrarActividad extends StatefulWidget {
  final String rol;

  const RegistrarActividad({super.key, required this.rol});

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

            if (archivoSeleccionado != null)
              const Text(
                "Archivo: evidencia.pdf",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

            const SizedBox(height: 30),

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

          // HOME
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Home(rol: widget.rol),
              ),
            );
          }

          // MIS HORAS
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MisHoras(rol: widget.rol),
              ),
            );
          }

          // PERFIL
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Perfil(rol: widget.rol),
              ),
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