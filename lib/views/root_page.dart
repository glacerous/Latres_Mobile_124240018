import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/root_controller.dart';
import 'favorite_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

class RootPage extends StatelessWidget {
  RootPage({super.key});

  final RootController controller = Get.find<RootController>();

  final List<Widget> _pages = [
    HomePage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: _pages[controller.selectedIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: Colors.redAccent,
            onTap: controller.changeTab,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorit',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
          ),
        ));
  }
}