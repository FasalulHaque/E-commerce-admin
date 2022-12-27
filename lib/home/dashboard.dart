import 'package:flutter/material.dart';
import 'package:seller/home/acccount.dart';
import 'package:seller/home/home.dart';
import 'package:seller/home/orders.dart';

import 'package:seller/view_product/view_product.dart';

class Dashbard extends StatefulWidget {
  const Dashbard({super.key});

  @override
  State<Dashbard> createState() => _DashbardState();
}

class _DashbardState extends State<Dashbard> {
  int _selectedindex = 0;

  void _onltemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  final List<Widget> _widgets = [
    const HomeScreen(),
    viewProduct(),
    const Orders(),
    const Account()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets.elementAt(_selectedindex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Color.fromARGB(255, 117, 117, 117),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'View Product',
            icon: Icon(
              Icons.production_quantity_limits_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Orders  ',
            icon: Icon(Icons.offline_bolt_sharp),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(
              Icons.account_box,
            ),
          ),
        ],
        currentIndex: _selectedindex,
        // selectedItemColor: Colors.yellow,
        onTap: _onltemTapped,
      ),
    );
  }
}
