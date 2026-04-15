import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProyeccionSocial extends StatefulWidget {
  const ProyeccionSocial({super.key});

  @override
  State<ProyeccionSocial> createState() => _ProyeccionSocialState();
}

class _ProyeccionSocialState extends State<ProyeccionSocial> {
  final supabase = Supabase.instance.client;
  List usuarios = [];

  @override
  void initState() {
    super.initState();
    obtenerUsuarios();
  }

  // OBTENER USUARIOS
  Future<void> obtenerUsuarios() async {
    final data = await supabase.from('usuarios').select();
    setState(() {
      usuarios = data;
    });
  }

  // ELIMINAR USUARIO
  Future<void> eliminarUsuario(int id) async {
    await supabase.from('usuarios').delete().eq('id', id);
    obtenerUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2E4A9E),
        title: const Text('Panel Administrativo'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: usuarios.isEmpty
            ? const Center(child: Text('No hay usuarios'))
            : ListView.builder(
                itemCount: usuarios.length,
                itemBuilder: (context, index) {
                  final user = usuarios[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2E4A9E),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white24,
                          child: Icon(Icons.person, color: Colors.yellow),
                        ),
                        const SizedBox(width: 16),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user['nombre'] ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                user['correo'] ?? '',
                                style: const TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),

                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            eliminarUsuario(user['id']);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),

      // BOTÓN PARA CREAR USUARIO 
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFF0B429),
        child: const Icon(Icons.add),
        onPressed: () {
          // pemdiente pantalla de agregar usuario
        },
      ),
    );
  }
}