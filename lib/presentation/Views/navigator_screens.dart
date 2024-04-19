import 'package:app_manglar/custom_icons_icons.dart';
import 'package:app_manglar/presentation/Views/deforestation_view.dart';
import 'package:app_manglar/presentation/Views/ecosystem.dart';
import 'package:app_manglar/presentation/Views/habitat_view.dart';
import 'package:app_manglar/presentation/Views/home_view.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

import 'package:get/get.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NavigationController();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Super Manglar',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0XFFD67BFF),
                fontFamily: 'MadimiOne'),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff45FFCA),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  // Acceder al Scaffold usando el contexto pasado
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),





        bottomNavigationBar: Obx(
          () => NavigationBar(
            backgroundColor: const Color(0xff45FFCA),
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_filled, color: Colors.pink,), label: 'Home'),
              NavigationDestination(
                  icon: Icon(CustomIcons.deforestation, color: Colors.pink,), label: 'Deforestation'),
              NavigationDestination(
                  icon: Icon(CustomIcons.pets, color: Colors.pink), label: 'Habitat'),
              NavigationDestination(
                  icon: Icon(CustomIcons.spa, color: Colors.pink), label: 'Ecosystem')
            ],
          ),
        ),
        body: Obx(
          () => controller.screens[controller.selectedIndex.value],
        ),
      ),
    );
  }
}

class NavigationController extends ChangeNotifier {
  final Rx<int> selectedIndex = 0.obs;
  final List<Widget> screens = [
    const HomeView(),
    const DeforestationScreen(),
    const Habitat(),
    const Ecosystem(),
  ];

  void navigateToScreen(int index, BuildContext context) {
    selectedIndex.value = index;
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        duration:
            const Duration(seconds: 2), // Choose your preferred transition
        child: screens[index],
      ),
    );
  }
}
