//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_app/vue/inscription.dart';
import 'connexion.dart';
import 'catalog.dart';

class NavBar extends StatefulWidget {
  int selectedIndex;

  NavBar({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  //int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.selectedIndex,
          onTap: (int index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Inscription()),
              );
            }
            else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Connexion()),
              );
            }
            else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Catalog()),
              );
            }
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Incription',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Connexion',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_sharp),
              label: 'Catalogue',
            )
          ]
      );
  }
}
