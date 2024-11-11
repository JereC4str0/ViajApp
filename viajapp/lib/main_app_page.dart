// lib/main_app_page.dart
import 'package:flutter/material.dart';
import 'activities_page.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'user_profile.dart';

class MainAppPage extends StatefulWidget {
  final UserProfile userProfile;

  MainAppPage({required this.userProfile});

  @override
  _MainAppPageState createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  int _currentIndex = 0;

  List<Map<String, String>> trips = []; // Lista para almacenar los viajes

  // Asegúrate de que esta función acepte los cuatro parámetros necesarios
  void _addTrip(String from, String to, String driverName, String vehicle) {
    setState(() {
      trips.add({
        'from': from,
        'to': to,
        'driver': driverName,
        'vehicle': vehicle,
        'date': DateTime.now().toIso8601String(), // Guardar la fecha
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [
      HomePage(onTripCreated: _addTrip), // Pasar la función para agregar viajes
      ActivitiesPage(trips: trips), // Pasar la lista de viajes
      SettingsPage(userProfile: widget.userProfile),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('DriveOrRide'),
        backgroundColor: Colors.black,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Actividades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configuración',
          ),
        ],
      ),
    );
  }
}
