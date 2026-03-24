import 'package:flutter/material.dart';
import 'home.dart';

//Pantalla de muestra el progreso de horas del usuario
class MisHoras extends StatelessWidget {
  const MisHoras({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //colo de fondo
      backgroundColor: const Color(0xFFF4F6FA),
      
      //barra superior
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E4A9E),
        title: const Text("Mis horas"),
      ),
      
      //contenido principal
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 10),
            //titulo de seccion
            const Text(
              "RESUMEN DE PROGRESO",
              style: TextStyle(
                letterSpacing: 2,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),
             
             //tarjeta de horas generales
            _buildCard(
              icon: Icons.assignment,
              title: "Servicio Social Obligatorio",
              subtitle: "Horas generales: 120 / 400",
            ),

            const SizedBox(height: 20),
            //tarjeta de horas ambientales
            _buildCard(
              icon: Icons.eco,
              title: "Actividades Ecológicas",
              subtitle: "Horas ambientales: 40 / 100",
            ),

            const SizedBox(height: 30),
             
             //tarjeta de resumen total de hora
            _buildTotalCard(),

          ],
        ),
      ),
      
      //menu inferior
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF2E4A9E),
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        //navegacion hacia otras pantallas
        onTap: (index) {
          
          //ir a pantalla principal
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
          }

        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: "Mis horas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
  

  //metodo reutilizable para tarjetas de informacion
  Widget _buildCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          //icono representativo
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF4D6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.orange),
          ),
          const SizedBox(width: 16),

          //informacion de la tarjeta
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  //tarjeta destacada con el total de horas acumuladas
  Widget _buildTotalCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFC107),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.bar_chart,
              color: Colors.blue,
              size: 28,
            ),
          ),

          const SizedBox(width: 20),
          
          //informacion total
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ACUMULADO TOTAL",
                  style: TextStyle(letterSpacing: 2),
                ),
                SizedBox(height: 6),
                Text(
                  "Horas totales: 160",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.verified,
            color: Colors.orange,
            size: 40,
          )
        ],
      ),
    );
  }
}