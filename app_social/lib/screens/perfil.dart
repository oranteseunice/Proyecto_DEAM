import 'package:flutter/material.dart';
import 'home.dart';
import 'mis_horas.dart';

//pantalla que muestra la informacion del usuario
class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //color de fondo
      backgroundColor: const Color(0xFFF4F6FA),
      
      //barra superior
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E4A9E),
        title: const Text("Mi perfil"),
      ),
 
      //contenido principal
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 20),
            
            //avatar del usuario
            const CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xFF2E4A9E),
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),
            //nombre del usuario
            const Text(
              "Salma Andrade",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),
            
            //carrea o informacion adicional
            const Text(
              "Ingeniería en Sistemas",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),
             
             //tarjetas de informacion del usuario
            _buildInfoCard(Icons.badge, "Carnet", "UCAD2021001"),
            const SizedBox(height: 15),

            _buildInfoCard(Icons.email, "Correo", "salma@email.com"),
            const SizedBox(height: 15),

            _buildInfoCard(Icons.school, "Horas requeridas", "500 horas"),
            const SizedBox(height: 15),

            _buildInfoCard(Icons.access_time, "Horas completadas", "160 horas"),

            const SizedBox(height: 30),
            

            //boton para cerrar sesion (sin funcionalidad por ahora)
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E4A9E),
                foregroundColor: const Color(0xFFFFC107),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.logout),
              label: const Text("Cerrar sesión"),
            ),

          ],
        ),
      ),

      //menu inferior de navegacion
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF2E4A9E),
        unselectedItemColor: Colors.grey,
        currentIndex: 2,
        //navegacion entre pantallas
        onTap: (index) {

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

        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), label: "Mis horas"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
  
  //metodo reurilizable para mostrar infomacion del usuario
  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [

          Icon(icon, color: const Color(0xFF2E4A9E)),

          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}