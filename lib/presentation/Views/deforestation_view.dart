import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:app_manglar/presentation/customswidgets/custom_selectable_cards.dart';

import '../customswidgets/custom_cards_with_animations.dart';

class DeforestationScreen extends StatelessWidget {
  const DeforestationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE0F4FF),
      body: Center(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16.0),
                  const SizedBox(height: 16.0),
                  CartaDeslizable(
                    audioPath: 'audio/popup1_audio.mp3',
                    lottiePath: 'assets/animations/p1.json',
                    imagePopup: 'assets/images/popup1.jpg',
                    title_popup: 'Dato impactante',
                    desc_popup: "Cada año se pierden alrededor de 1.67 millones de acres de manglar en todo el mundo debido a la deforestación y el desarrollo costero",
                    titulo: '¡Bienvenido!',
                    descripcion: '¡Empecemos!',
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 300,
                    myColor: Color(0XFFCBFFA9),
                  ),
                  const SizedBox(height: 16.0),
                  CartaDeslizable(
                    audioPath: 'audio/popup2_audio.mp3',
                    lottiePath: 'assets/animations/p1.json',
                    imagePopup: 'assets/images/popup2.jpeg',
                    title_popup: 'Consecuencias:',
                    desc_popup: "La deforestación de los manglares pone en riesgo a cientos de especies de peces, aves y otros animales que dependen de este ecosistema. También reduce la protección natural contra tormentas, inundaciones y erosión costera",

                    titulo: 'Consecuencias',
                    descripcion: '¿Qué desencadena?',
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 300,
                    myColor: Color(0XFFF3CCF3),
                  ),
                  const SizedBox(height: 16.0),
                  CartaDeslizable(
                    audioPath: 'audio/popup3_audio.mp3',
                    lottiePath: 'assets/animations/p1.json',
                    imagePopup: 'assets/images/popup3.jpg',
                    title_popup: 'Causas principales',
                    desc_popup: "Las principales causas de la deforestación de manglares son la tala para obtener madera, el desarrollo de áreas costeras para turismo y vivienda, la acuacultura y la contaminación",

                    titulo: 'Causas principales',
                    descripcion: 'Los orígenes',
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 300,
                    myColor: Color(0XFFF6FA70),
                  ),
                  const SizedBox(height: 16.0),
                  CartaDeslizable(
                    audioPath: 'audio/popup4_audio.mp3',
                    lottiePath: 'assets/animations/p1.json',
                    imagePopup: 'assets/images/popup4.jpg',
                    title_popup: 'Llamado a la acción',
                    desc_popup: "¡Tú puedes ayudar a detener la deforestación de los manglares! Reduce tu huella de carbono, apoya organizaciones que trabajan en la conservación de estos ecosistemas y educa a otros sobre su importancia",
                    titulo: '¡Hagamos el cambio!',
                    descripcion: 'Nosotros podemos hacer la diferencia',
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 300,
                    myColor: Color(0XFFB4BDFF),
                  ),
                  const SizedBox(height: 16.0),
                  CartaDeslizable(
                    audioPath: 'audio/popup5_audio.mp3',
                    lottiePath: 'assets/animations/p1.json',
                    imagePopup: 'assets/images/popup5.jpg',
                    title_popup: 'Datos esperanzadores',
                    desc_popup: "Gracias a los esfuerzos de conservación, algunas áreas de manglar están siendo restauradas y protegidas. ¡Con tu ayuda podemos seguir recuperando estos valiosos ecosistemas!",
                    titulo: 'Los buenos somos más',
                    descripcion: 'Pequeños cambios mueven el mundo',
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 300,
                    myColor: Color(0XFFFFD9C0),
                  ),
                  const SizedBox(height: 16.0),


                  SizedBox(
                    height: 50,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'MadimiOne',
                          color: Colors.black
                      ),
                      textAlign: TextAlign.center,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          FadeAnimatedText('¡Selecciona lo que ayuda al manglar!', textAlign: TextAlign.center),

                        ] ,
                        onTap: () {},
                        repeatForever: true,
                        isRepeatingAnimation: true,
                        displayFullTextOnTap: true,

                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),


                  CardListWidget(cardSize: 150),

                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

