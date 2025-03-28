// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase/supabase.dart';

final supabase = SupabaseClient('https://fvfoznhaepggbyykkoea.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ2Zm96bmhhZXBnZ2J5eWtrb2VhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI1NzIyMDUsImV4cCI6MjAzODE0ODIwNX0.gTkzwmWjjrr3s5GxRBIiahlyaj2iqp3_Y0NOUsZceaA');

Future<void> deleteImageFromBucket(String? imageUrl) async {
  if (imageUrl == null) {
    print('URL de imagen no proporcionada');
    return; // Salir de la función si la URL de la imagen es nula
  }
  try {
    // Extraer el nombre del archivo de la URL
    final List<String> urlParts = imageUrl.split('/');
    final String imageName = urlParts.last;

    final response = await supabase.storage.from('reportpictures').remove(
        ['pics/$imageName']); // Especificar la ruta completa de la imagen
    if (response.isEmpty) {
      print('Imagen borrada con éxito');
      // Realizar cualquier otra acción después de eliminar la imagen
    } else {
      print('Error al borrar imagen');
      // Manejar el error según sea necesario
    }
  } catch (e) {
    print('Error: $e');
    // Manejar el error según sea necesario
  }
}
