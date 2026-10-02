import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:markti/features/home/home_view.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Widget> pages = [
    HomeView(),
    Center(child: Text('Cart Page')),
    Center(child: Text('Favorites Page')),
    Center(child: Text('Menu Page')),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            elevation: 12,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                ),
                child: BottomNavigationBar(
                    currentIndex: currentIndex,
                    onTap: (index) {
                      currentIndex = index;
                      setState(() {});
                      print('Tapped on index: $index');
                    },
                    elevation: 0,
                    // backgroundColor: Colors.transparent,
                    // landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
                    // type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.blue,
                    selectedIconTheme:
                        IconThemeData(color: Colors.blue, size: 25),
                    // iconSize: 20,
                    items: [
                      BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          'assets/images/icons/home_icon.svg',
                          height: 18,
                          width: 18,
                          color: Colors.blue,
                        ),
                        icon: SvgPicture.asset(
                          'assets/images/icons/home_icon.svg',
                          height: 20,
                          width: 20,
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/images/icons/cart_icon.svg',
                          height: 18,
                          width: 18,
                        ),
                        label: 'Cart',
                        activeIcon: SvgPicture.asset(
                          'assets/images/icons/cart_icon.svg',
                          height: 20,
                          width: 20,
                          color: Colors.blue,
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/images/icons/heart_icon.svg',
                          height: 18,
                          width: 18,
                        ),
                        activeIcon: SvgPicture.asset(
                          'assets/images/icons/heart_icon.svg',
                          height: 20,
                          width: 20,
                          color: Colors.blue,
                        ),
                        label: 'Favorites',
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                            'assets/images/icons/menu_icon.svg'),
                        label: 'Menu',
                        activeIcon: SvgPicture.asset(
                          'assets/images/icons/menu_icon.svg',
                          height: 18,
                          width: 18,
                          color: Colors.blue,
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ),
        // bottomNavigationBar:
        body: pages[currentIndex]);
  }
}
