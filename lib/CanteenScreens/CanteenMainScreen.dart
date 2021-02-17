import 'package:flutter/material.dart';
import 'CanteenAccountScreen.dart';
import 'CanteenDeliveryScreen.dart';
import 'CanteenEditMenuScreen.dart';
import 'CanteenOrderScreen.dart';
import 'CanteenScanScreen.dart';

class CanteenMainScreen extends StatefulWidget {
  @override
  _CanteenMainScreenState createState() => _CanteenMainScreenState();
}

class _CanteenMainScreenState extends State<CanteenMainScreen> {
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red[300],
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        currentIndex: _currentindex,
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood), title: Text("orders")),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping), title: Text("delivery")),
          BottomNavigationBarItem(
              icon: Icon(Icons.find_in_page), title: Text("scan")),
          BottomNavigationBarItem(
              icon: Icon(Icons.rate_review), title: Text("edit")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("account")),
        ],
        type: BottomNavigationBarType.fixed,
      ),
      body: getbodywidget(),
    );
  }

  getbodywidget() {
    if (_currentindex == 0) {
      return CanteenOrderScreen();
    }
    if (_currentindex == 1) {
      return CanteenDeliveryScreen();
    }
    if (_currentindex == 2) {
      return CanteenScanScreen();
    }
    if (_currentindex == 3) {
      return CanteenEditMenuScreen();
    }
    if (_currentindex == 4) {
      return CanteenAccountScreen();
    }
  }
}
