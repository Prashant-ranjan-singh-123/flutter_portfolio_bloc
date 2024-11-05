import 'package:flutter/material.dart';
import 'package:prashant_portfolio/reusable/background.dart';
import 'package:prashant_portfolio/utils/app_color.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavBarUi extends StatelessWidget {
  final int initialPageIndex;
  BottomNavBarUi({super.key, required this.initialPageIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.instance().background,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Background(
            child: _pages[initialPageIndex],
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColor.instance().background,
          type: BottomNavigationBarType.fixed,
          currentIndex: initialPageIndex,
          unselectedItemColor: AppColor.instance().bottomNavInactiveItem,
          selectedItemColor: AppColor.instance().bottomNavActiveText,
          selectedLabelStyle: const TextStyle(color: Colors.white),
          unselectedLabelStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          onTap: (index) {
            // controller.setPageIndex(index);
          },
          items: [
            _buildBottomNavigationBarItem(Iconsax.tag_user, 'About Me'),
            _buildBottomNavigationBarItem(Iconsax.buildings, 'Carrier'),
            _buildBottomNavigationBarItem(Iconsax.magic_star, 'Projects'),
            _buildBottomNavigationBarItem(Iconsax.medal_star, 'Certificate'),
          ],
        ));
  }

  // Helper method to build individual items of the Bottom Navigation Bar
  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Card(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Icon(icon, color: Colors.white.withOpacity(0.3)),
        ),
      ),
      label: label,
      activeIcon: Card(
        color: AppColor.instance().bottomNavCard,
        elevation: 15,
        shadowColor: AppColor.instance().bottomNavCardShadow,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Icon(icon, color: AppColor.instance().bottomNavActiveIcon),
        ),
      ),
    );
  }

  // List of pages to be displayed
  List<Widget> get _pages => [
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
        // HomeScreen(),
        // CarrierScreen(),
        // WorkScreen(),
        // CertificateScreen(),
      ];
}
