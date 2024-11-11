// lib/home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Function(String, String, String, String) onTripCreated; // Aceptar cuatro parámetros

  HomePage({required this.onTripCreated}); // Constructor requiere el parámetro

  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _driverNameController = TextEditingController();
  final TextEditingController _vehicleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Campo "Desde"
          TextField(
            controller: _fromController,
            decoration: InputDecoration(
              labelText: 'Desde',
              filled: true,
              fillColor: Colors.grey[850],
              border: OutlineInputBorder(),
              labelStyle: TextStyle(color: Colors.white),
            ),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 16.0),

          // Campo "Hasta"
          TextField(
            controller: _toController,
            decoration: InputDecoration(
              labelText: 'Hasta',
              filled: true,
              fillColor: Colors.grey[850],
              border: OutlineInputBorder(),
              labelStyle: TextStyle(color: Colors.white),
            ),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 16.0),

          // Campo "Conductor"
          TextField(
            controller: _driverNameController,
            decoration: InputDecoration(
              labelText: 'Nombre del Conductor',
              filled: true,
              fillColor: Colors.grey[850],
              border: OutlineInputBorder(),
              labelStyle: TextStyle(color: Colors.white),
            ),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 16.0),

          // Campo "Vehículo"
          TextField(
            controller: _vehicleController,
            decoration: InputDecoration(
              labelText: 'Vehículo',
              filled: true,
              fillColor: Colors.grey[850],
              border: OutlineInputBorder(),
              labelStyle: TextStyle(color: Colors.white),
            ),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 24.0),

          // Botón "Guardar Viaje"
          Center(
            child: ElevatedButton(
              onPressed: () {
                String from = _fromController.text;
                String to = _toController.text;
                String driverName = _driverNameController.text;
                String vehicle = _vehicleController.text;

                // Llamar a la función para crear el viaje
                onTripCreated(from, to, driverName, vehicle);
                
                // Limpiar los campos después de enviar
                _fromController.clear();
                _toController.clear();
                _driverNameController.clear();
                _vehicleController.clear();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text('Guardar Viaje', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
