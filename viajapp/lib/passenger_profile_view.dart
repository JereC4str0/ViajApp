// lib/passenger_profile_view.dart
import 'package:flutter/material.dart';
import 'user_profile.dart';

class PassengerProfileView extends StatelessWidget {
  final UserProfile userProfile;

  PassengerProfileView({required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Pasajero'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Nombre: ${userProfile.name}', style: TextStyle(color: Colors.white, fontSize: 20)),
              Text('Email: ${userProfile.email}', style: TextStyle(color: Colors.white, fontSize: 20)),
              Text('Teléfono: ${userProfile.phone}', style: TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
