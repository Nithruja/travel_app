import 'package:flutter/material.dart';

import '../home/home_screen.dart';



class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.local_atm),
            label: '',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle), label: ''),
      ],
      selectedItemColor: Colors.red,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,

      // currentIndex: 0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (index) {
        setState(
          () {
            currentIndex = index;
          },
        );

        switch (currentIndex) {
          case 0:
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomeScreen()),
            // );
            break;
          case 1:
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) =>HomeScreen()),
            // );
            break;
          case 2:
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomeScreen()),
            // );
            break;
          case 3:
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomeScreen()),
            // );
            break;

          default:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()
            ));

         }

        setState(() {

        });

        print("Tapped");
      },
    );
  }
}
