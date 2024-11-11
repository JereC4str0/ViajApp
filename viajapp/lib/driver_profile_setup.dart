// lib/driver_profile_setup.dart
import 'package:flutter/material.dart';
import 'user_profile.dart';
import 'driver_profile_view.dart';
import 'main_app_page.dart';

class DriverProfileSetup extends StatefulWidget {
  @override
  _DriverProfileSetupState createState() => _DriverProfileSetupState();
}

class _DriverProfileSetupState extends State<DriverProfileSetup> {
  String? _vehicleType;
  final _modelController = TextEditingController();
  final _plateController = TextEditingController();
  final _contactController = TextEditingController();

  void _submit() {
    if (_contactController.text.isEmpty || _modelController.text.isEmpty || _plateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, completa todos los campos.')),
      );
      return;
    }

    final userProfile = UserProfile(
      name: "Conductor",
      email: "example@example.com",
      phone: _contactController.text,
      vehicleModel: _modelController.text,
      vehiclePlate: _plateController.text,
      vehicleType: _vehicleType ?? 'Unknown',
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MainAppPage(userProfile: userProfile)),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración del Perfil de Conductor'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Detalles del Vehículo', style: TextStyle(color: Colors.white, fontSize: 18)),
            SizedBox(height: 10),
            TextField(
              controller: _modelController,
              decoration: InputDecoration(
                labelText: 'Modelo del Vehículo',
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _plateController,
              decoration: InputDecoration(
                labelText: 'Placa del Vehículo',
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Text('Método de Contacto', style: TextStyle(color: Colors.white, fontSize: 18)),
            SizedBox(height: 10),
            TextField(
              controller: _contactController,
              decoration: InputDecoration(
                labelText: 'Número de Teléfono o enlace de contacto',
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Text('Tipo de Vehículo', style: TextStyle(color: Colors.white, fontSize: 18)),
            Row(
              children: <Widget>[
                Expanded(
                  child: ListTile(
                    title: Text('Coche', style: TextStyle(color: Colors.white)),
                    leading: Radio(
                      value: 'Car',
                      groupValue: _vehicleType,
                      onChanged: (value) {
                        setState(() {
                          _vehicleType = value as String?;
                        });
                      },
                      activeColor: Colors.pink,
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('Motocicleta', style: TextStyle(color: Colors.white)),
                    leading: Radio(
                      value: 'Motorcycle',
                      groupValue: _vehicleType,
                      onChanged: (value) {
                        setState(() {
                          _vehicleType = value as String?;
                        });
                      },
                      activeColor: Colors.pink,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              child: Text('Guardar'),
            ),
            SizedBox(height: 20),
            Center(
              child: Text('AlterMundi © 2024', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
