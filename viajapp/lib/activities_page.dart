// lib/activities_page.dart
import 'package:flutter/material.dart';

class ActivitiesPage extends StatelessWidget {
  final List<Map<String, String>> trips; // Aceptar la lista de viajes

  ActivitiesPage({required this.trips}); // Constructor actualizado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actividades'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Desde: ${trips[index]['from']}', style: TextStyle(color: Colors.white)),
                  Text('Hasta: ${trips[index]['to']}', style: TextStyle(color: Colors.white)),
                  SizedBox(height: 8.0),
                  Text('Conductor: ${trips[index]['driver']}', style: TextStyle(color: Colors.grey)),
                  Text('Vehículo: ${trips[index]['vehicle']}', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      // Acción para unirse al viaje
                    },
                    child: Text('Join Trip'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
