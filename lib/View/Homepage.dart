import 'package:clickdrop/View/Calendar.dart';
import 'package:clickdrop/View/Outfits.dart';
import 'package:clickdrop/View/Profile.dart';
import 'package:clickdrop/View/Wardrobe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Add.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex =0;

  final _screens = [
    Wardrobe(),
    Outfits(),
    AddPage(),
    CalendarPage(),
    ProfilePage()
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Wardrobe',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: 'Outfits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],

        selectedItemColor: Color(0xFFE65C4F),
        unselectedItemColor: Color(0xFF78A6C8),
        onTap: (n)=>{
          setState((){
            _selectedIndex = n;
          })
        },

      ),
      body: IndexedStack(
                index: _selectedIndex,
                children: _screens,
              ),

      appBar: AppBar(
        title: const Center(child: Text('ClickDrobe')),
      ),

    ));
  }
}
