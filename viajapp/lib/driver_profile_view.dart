// lib/driver_profile_view.dart
import 'package:flutter/material.dart';
import 'user_profile.dart';

class DriverProfileView extends StatelessWidget {
  final UserProfile userProfile;

  DriverProfileView({required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Conductor'),
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
              Text('Modelo de Vehículo: ${userProfile.vehicleModel}', style: TextStyle(color: Colors.white, fontSize: 20)),
              Text('Placa de Vehículo: ${userProfile.vehiclePlate}', style: TextStyle(color: Colors.white, fontSize: 20)),
              Text('Tipo de Vehículo: ${userProfile.vehicleType}', style: TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
