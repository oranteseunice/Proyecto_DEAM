import 'package:flutter/material.dart';
import '../screens/mis_horas.dart';
import '../screens/perfil.dart';
import '../screens/ver_actividades.dart';
import '../screens/registrar_actividad.dart';
import '../screens/admin/proyeccion_social.dart';

class Home extends StatefulWidget {
  final String rol;

  const Home({super.key, required this.rol});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final esAdmin = widget.rol == 'admin';

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

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

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

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

            // VER ACTIVIDADES
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerActividades(rol: widget.rol),
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

            // MIS HORAS
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MisHoras(rol: widget.rol),
                  ),
                );
              },
              child: _buildCard(
                Icons.access_time,
                'Mis horas',
                'Consulta tu progreso actual',
              ),
            ),

            const SizedBox(height: 20),

            // REGISTRAR ACTIVIDAD
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrarActividad(rol: widget.rol),
                  ),
                );
              },
              child: _buildCard(
                Icons.add,
                'Registrar actividad',
                'Reportar nuevas horas',
              ),
            ),
            const SizedBox(height: 20),

            // PANEL ADMIN SOLO SI ES ADMIN
            if (esAdmin)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProyeccionSocial(),
                    ),
                  );
                },
                child: _buildCard(
                  Icons.admin_panel_settings,
                  'Panel Administrativo',
                  'Gestión de actividades',
                ),
              ),

            const SizedBox(height: 30),

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

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF2E4A9E),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MisHoras(rol: widget.rol),
              ),
            );
          }

          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Perfil(rol: widget.rol)),
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
