// lib/settings_page.dart
import 'package:flutter/material.dart';
import 'user_profile.dart';

class SettingsPage extends StatefulWidget {
  final UserProfile userProfile;

  SettingsPage({required this.userProfile});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.userProfile.name;
    _emailController.text = widget.userProfile.email;
    _phoneController.text = widget.userProfile.phone;
  }

  void _saveChanges() {
    // Aquí se podrían implementar los cambios, como actualizar el perfil en una base de datos.
    Navigator.pop(context); // Regresar después de guardar los cambios
  }

  // Método para seleccionar una imagen
  void _selectImage() {
    // Puedes implementar la lógica para seleccionar una imagen usando Image Picker aquí.
    print("Imagen seleccionada"); // Placeholder acción
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: _selectImage, // Se llama al seleccionar la imagen del perfil
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Imagen de placeholder
                    child: Icon(Icons.camera_alt, size: 50, color: Colors.white), // Icono que aparece si no se ha seleccionado imagen
                    backgroundColor: Colors.grey[800],
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nombre', labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Teléfono', labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveChanges,
                child: Text('Guardar Cambios'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
