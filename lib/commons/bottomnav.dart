import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final int currentindex;
  final ValueChanged<int> onItemTapped;
  const BottomNav({super.key, required this.currentindex,required this.onItemTapped});

  @override
  State<BottomNav> createState() => _BottomNavState();
  
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.format_quote), label: 'Quotes'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: widget.currentindex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
    );
  
  }

  void _onItemTapped(int index)
  {
    setState(() {
      widget.onItemTapped(index);
    });
    if (index == 0) {
      Navigator.pushNamed(context, '/homepage');
    }
    else if (index == 1) {
      Navigator.pushNamed(context, '/second');
    }
    else if (index == 2) {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn()));
      Navigator.pushNamed(context, '/profile');
    }
}
}