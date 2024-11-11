// lib/passenger_profile_setup.dart
import 'package:flutter/material.dart';
import 'user_profile.dart';
import 'passenger_profile_view.dart';
import 'main_app_page.dart';

class PassengerProfileSetup extends StatefulWidget {
  @override
  _PassengerProfileSetupState createState() => _PassengerProfileSetupState();
}

class _PassengerProfileSetupState extends State<PassengerProfileSetup> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _submit() {
    if (_nameController.text.isEmpty || _emailController.text.isEmpty || _phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, completa todos los campos.')),
      );
      return;
    }

    final userProfile = UserProfile(
      name: _nameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
      vehicleModel: "",
      vehiclePlate: "",
      vehicleType: "",
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
        title: Text('Configuración del Perfil de Pasajero'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Nombre', style: TextStyle(color: Colors.white, fontSize: 16)),  // Asegúrate de que esta línea esté correcta
              TextField(
                controller: _nameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingresa tu nombre',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[850],
                ),
              ),
              SizedBox(height: 16.0),
              Text('Email', style: TextStyle(color: Colors.white, fontSize: 16)),
              TextField(
                controller: _emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingresa tu email',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[850],
                ),
              ),
              SizedBox(height: 16.0),
              Text('Teléfono', style: TextStyle(color: Colors.white, fontSize: 16)),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingresa tu teléfono',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[850],
                ),
              ),
              SizedBox(height: 16.0),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                  child: Center(
                    child: Text('Guardar', style: TextStyle(fontSize: 18.0, color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
