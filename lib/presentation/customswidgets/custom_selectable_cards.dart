import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Importar el paquete Lottie

class CardModel {
  final String content;
  bool isSelected;
  final bool isEven; // Nueva propiedad para identificar cartas pares

  CardModel(
      {required this.content, this.isSelected = false, required this.isEven});
}

class CardWidget extends StatelessWidget {
  final CardModel card;
  final double cardSize;
  final VoidCallback onTap;

  CardWidget(
      {required this.card, required this.cardSize, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: card.isSelected
            ? card.isEven
            ? Colors.greenAccent
            : Colors.redAccent // Colores diferentes para pares e impares
            : Colors.white,
        child: SizedBox(
          width: cardSize,
          height: cardSize,
          child: Center(
            child: Text(
              card.content,
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class CardListWidget extends StatefulWidget {
  final double cardSize;

  CardListWidget({required this.cardSize});

  @override
  _CardListWidgetState createState() => _CardListWidgetState();
}

class _CardListWidgetState extends State<CardListWidget> {
  List<CardModel> cards = [
    CardModel(content: 'Plantar manglares', isEven: true),
    CardModel(content: 'Tirar basura a los ríos', isEven: false),
    CardModel(content: 'Reducir huella ecológica', isEven: true),
    CardModel(content: 'Alterar el flujo natural de agua', isEven: false),
    CardModel(content: 'Áreas protegidas', isEven: true),
    CardModel(content: 'Aumento del nivel del mar', isEven: false),
    CardModel(content: 'Educar a las personas', isEven: true),
    CardModel(content: 'Tala de árboles', isEven: false),
    CardModel(content: 'Prácticas sostenibles de pesca', isEven: true),
    CardModel(content: 'Programas de reforestación', isEven: false),
  ];

  int greenCardCount = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16.0, // Espacio horizontal entre las cartas
          runSpacing: 16.0, // Espacio vertical entre las filas de cartas
          children: cards.map((card) {
            return CardWidget(
              card: card,
              cardSize: widget.cardSize,
              onTap: () {
                setState(() {
                  card.isSelected = !card.isSelected;
                  if (card.isSelected && card.isEven) {
                    greenCardCount++;
                  } else if (!card.isSelected && card.isEven) {
                    greenCardCount--;
                  }
                });
              },
            );
          }).toList(),
        ),
        if (greenCardCount == 5)
          Positioned.fill(
            child:
            Lottie.asset('assets/animations/congratulationsAnimation.json',
              width: MediaQuery.of(context).size.width * 0.8,
              height: 800,
              fit: BoxFit.cover,

              ),
          ),
      ],
    );
  }
}