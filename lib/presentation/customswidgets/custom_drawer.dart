import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final String url; // Replace with your asset image path
  final Color backgroundColor; // Replace with your desired color

  const MyDrawer({
    super.key,
    required this.url,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Set background color of the drawer
      backgroundColor: backgroundColor,
      child: ListView(
        // Center the content of the list using padding
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        children: [
          // Row for photo
          Row(
            // Center the photo within the row using mainAxisAlignment
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circular photo
              CircleAvatar(
                backgroundImage: AssetImage(url),
                radius: 50.0, // Adjust radius as needed
              ),
            ],
          ),
          const SizedBox(height: 20.0), // Add spacing between photo and list
          const Divider(
            color: Colors.grey,
            thickness: 1.0,
            height: 20.0,
            indent: 10.0,
            endIndent: 10.0,
          ),
          ListTile(
            title: const Text('Perfil'),
            onTap: () {
              // Acciones de la opción 1
              print('Opción 1 seleccionada');
            },
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1.0,
            height: 20.0,
            indent: 10.0,
            endIndent: 10.0,
          ),
          ListTile(
            title: const Text('Dar en adopción'),
            onTap: () {
              // Acciones de la opción 2
              print('Opción 2 seleccionada');
            },
          ),
        ],
      ),
    );
  }
}
