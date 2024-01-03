import 'package:flutter/material.dart';
import 'package:ihealthapp/features/diagnosticPage/diagnostic.dart';
import 'package:ihealthapp/features/doctorAndHospitalPage/doctors.dart';
import 'package:ihealthapp/features/healthPage/health.dart';
import 'package:ihealthapp/features/homePage/home.dart';
import 'package:ihealthapp/features/profilePage/profile.dart';


class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  NavigationPageState createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const DiagnosticPage(pageTitle: 'Diagnostic'),
    const HealthImprove(pageTitle: 'Health Improve'),
    const DoctorsPage(pageTitle: 'Doctors'),
    const ProfileMainPage(),  
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], 
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(187, 242, 239, 1.0),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}
