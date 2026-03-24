import 'package:flutter/material.dart';
import 'home.dart';
import 'mis_horas.dart';
import 'perfil.dart';

//pantalla que muestra las actividades disponibles
class VerActividades extends StatelessWidget {
  const VerActividades({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //color de fondo
      backgroundColor: const Color(0xFFF4F6FA),
      
      //barra superior
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 216, 184, 25),
        title: const Text("Actividades"),
      ),
      
      //contenido principal
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 20),
            //tarjetas de las horas disponibles
            _buildCard(Icons.eco, "Reforestación", "10 horas"),
            const SizedBox(height: 15),

            _buildCard(Icons.cleaning_services, "Limpieza comunitaria", "8 horas"),
            const SizedBox(height: 15),

            _buildCard(Icons.school, "Apoyo educativo", "12 horas"),

          ],
        ),
      ),
      

      //menu inferior de navegacion
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 223, 196, 19),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        //navegacion entre pantallas
        onTap: (index) {
          
          //ir a inicio
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
          }
          //ir a mis horas
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MisHoras(),
              ),
            );
          }
           //ir a pefil
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Perfil(),
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
          //icono de la actividad
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