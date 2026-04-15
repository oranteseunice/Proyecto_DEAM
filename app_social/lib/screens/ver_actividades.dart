import 'package:flutter/material.dart';
import 'home.dart';
import 'mis_horas.dart';
import 'perfil.dart';

//pantalla que muestra las actividades disponibles
class VerActividades extends StatelessWidget {
  final String rol;

  const VerActividades({super.key, required this.rol});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 216, 184, 25),
        title: const Text("Actividades"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 20),

            _buildCard(Icons.eco, "Reforestación", "10 horas"),
            const SizedBox(height: 15),

            _buildCard(Icons.cleaning_services, "Limpieza comunitaria", "8 horas"),
            const SizedBox(height: 15),

            _buildCard(Icons.school, "Apoyo educativo", "12 horas"),

          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 223, 196, 19),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {

          // HOME
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Home(rol: rol),
              ),
            );
          }

          // MIS HORAS
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MisHoras(rol: rol),
              ),
            );
          }

          // PERFIL
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Perfil(rol: rol),
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

  Widget _buildCard(IconData icon, String title, String horas) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color.fromARGB(255, 215, 175, 32)),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              const SizedBox(height: 4),
              Text(
                horas,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}