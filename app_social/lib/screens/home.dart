import 'package:flutter/material.dart';
import '../screens/mis_horas.dart';
import '../screens/perfil.dart';
import '../screens/ver_actividades.dart';
import '../screens/registrar_actividad.dart';

//Pnatlla principal de la aplicacion(menu de navegaion)
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //indice del menu inferior
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //color de fondo general
      backgroundColor: const Color(0xFFF4F6FA),

      //Barra superior
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E4A9E),
        elevation: 0,
        title: const Text('Menú Principal'),
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.person_outline),
          ),
        ],
      ),

      //contenido principal
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            //avatar representativo
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey.shade200,
              child: const Icon(
                Icons.school,
                size: 50,
                color: Color(0xFF2E4A9E),
              ),
            ),

            const SizedBox(height: 15),

            //nombre de la institucion
            const Text(
              'UCAD',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E4A9E),
              ),
            ),

            const Text(
              'SERVICIO SOCIAL',
              style: TextStyle(color: Colors.grey, letterSpacing: 2),
            ),

            const SizedBox(height: 30),

            //tarjeta que navega a la pantalla de actividades
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VerActividades(),
                  ),
                );
              },
              child: _buildCard(
                Icons.search,
                'Ver actividades',
                'Explora proyectos disponibles',
              ),
            ),

            const SizedBox(height: 20),

            //tarjeta que navega a la pantalla mis horas
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MisHoras()),
                );
              },
              child: _buildCard(
                Icons.access_time,
                'Mis horas',
                'Consulta tu progreso actual',
              ),
            ),

            const SizedBox(height: 20),

            //tarjeta pendiente (navegacion)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegistrarActividad(),
                  ),
                );
              },
              child: _buildCard(
                Icons.add,
                'Registrar actividad',
                'Reportar nuevas horas',
              ),
            ),

            const SizedBox(height: 30),

            //mensaje informativo
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: Color(0xFF2E4A9E)),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Recuerda que debes completar 500 horas totales para liberar tu servicio social.',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      //Menu inferios de navegacion
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF2E4A9E),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        //manejo de navegacion entre pantallas
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          //navega a mis horas
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MisHoras()),
            );
          }

          //navega a perfil
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Perfil()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Mis horas',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }

  //menu reutilizable para construir tarjetas del menu
  Widget _buildCard(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2E4A9E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white24,
            child: Icon(icon, color: Colors.yellow),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(subtitle, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.white),
        ],
      ),
    );
  }
}
