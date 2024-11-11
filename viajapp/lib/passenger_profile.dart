// lib/passenger_profile.dart
import 'package:flutter/material.dart';
import 'passenger_profile_setup.dart'; // Asegúrate de que este archivo exista

class PassengerProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PassengerProfileSetup()));
                },
                child: Center(child: Text('Configurar Perfil de Pasajero', style: TextStyle(fontSize: 18.0))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
