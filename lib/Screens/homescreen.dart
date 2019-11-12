import 'package:flutter/material.dart';
import 'package:fachbereich_ai_events/Screens/events.dart';

// ignore: camel_case_types
class newHomesScreen extends StatefulWidget {
  @override
  _newHomesScreenState createState() => _newHomesScreenState();
}

// ignore: camel_case_types
class _newHomesScreenState extends State<newHomesScreen> {
  int _selectedIndex = 0;

  final headlines = <Widget>[Text("Homepage"), Text("Events")];
  final pages = <Widget>[Text("Homepage"), Events()];


  void _onItemTapped(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headlines[_selectedIndex],
        leading: Icon(Icons.menu),
      ),

      body: Center(
        child: pages[_selectedIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              title: Text("Events"),
            ),
          ],

        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

    ),

    );
  }
}
