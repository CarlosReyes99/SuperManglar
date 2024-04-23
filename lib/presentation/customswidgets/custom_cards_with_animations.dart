import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CartaDeslizable extends StatefulWidget {
  final String audioPath;
  final String lottiePath;
  final String imagePopup;
  final String title_popup;
  final String desc_popup;
  final String titulo;
  final String descripcion;
  final double width;
  final double height;
  final Color myColor;

  const CartaDeslizable({
    super.key,
    required this.audioPath,
    required this.lottiePath,
    required this.imagePopup,
    required this.title_popup,
    required this.desc_popup,
    required this.titulo,
    required this.descripcion,
    required this.width,
    required this.height,
    this.myColor = Colors.white,
  });

  @override
  State<CartaDeslizable> createState() => _CartaDeslizableState();
}

class _CartaDeslizableState extends State<CartaDeslizable> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Card(
        color: widget.myColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                widget.lottiePath,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
                repeat: true,
                animate: true,
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.titulo,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(widget.descripcion),
              GestureDetector(
                onTap: () {
                  Player.play(widget.audioPath);
                  _showPopup(context, widget.imagePopup, widget.title_popup, widget.desc_popup);
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Lottie.asset(
                    'assets/animations/playCardDeforestation.json',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                    repeat: true,
                    animate: true,
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
class Player {
  static AudioPlayer? _player;
  static bool _isPlaying = false;

  static Future<void> play(String src) async {
    if (_isPlaying) {
      // Si ya hay una reproducción en curso, no hacer nada
      return;
    }

    try {
      _isPlaying = true;
      _player ??= AudioPlayer(); // Crear instancia de AudioPlayer si no existe

      await _player!.play(AssetSource(src));
    } catch (e) {
      print('Error al reproducir el audio: $e');
    } finally {
      _isPlaying = false;
    }
  }
}
void _showPopup(BuildContext context, String imagePopup, String title, String description) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Stack(
          children: [
            Image.asset(
              imagePopup,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MadimiOne',
                      color: Colors.white, // Cambiar el color del texto para que se vea sobre la imagen
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'MadimiOne',
                      color: Colors.white, // Cambiar el color del texto para que se vea sobre la imagen
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Cierra el popup
                    },
                    child: Text('Cerrar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}