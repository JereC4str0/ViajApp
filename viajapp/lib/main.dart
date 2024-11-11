
import 'package:flutter/material.dart';
import 'driver_profile_setup.dart';
import 'passenger_profile_setup.dart';
import 'user_profile.dart';
import 'activities_page.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'main_app_page.dart';

void main() {
  runApp(DriveOrRideApp());
}

class DriveOrRideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DriveOrRide',
      theme: ThemeData.dark(),
      home: UserSelectionPage(),
    );
  }
}

class UserSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '¿Eres conductor o pasajero?',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DriverProfileSetup()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: Text('Soy Conductor'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PassengerProfileSetup()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
              ),
              child: Text('Soy Pasajero'),
            ),
          ],
        ),
      ),
    );
  }
}

class MainAppPage extends StatefulWidget {
  final UserProfile userProfile;

  MainAppPage({required this.userProfile});

  @override
  _MainAppPageState createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  int _currentIndex = 0;

  List<Map<String, String>> trips = []; // Lista para almacenar los viajes

  // Método para agregar un viaje
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

