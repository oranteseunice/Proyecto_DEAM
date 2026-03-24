import 'package:flutter/material.dart';

//wirdget para botones principales de la aplicacion 
class BotonPrincipal extends StatelessWidget {
  //texto que se mostrara en el boton
  final String texto;

  //funcion que se ejecuta alpresionar el boton
  final VoidCallback onPressed;

  const BotonPrincipal({
    super.key,
    required this.texto,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // ocupa todo el ancho
      child: ElevatedButton(
        onPressed: onPressed,

        //estilo personalizado del boton
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E3A8A),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),

        //texto del boton
        child: Text(
          texto,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFFF0B429)
          ),
        ),
      ),
    );
  }
}