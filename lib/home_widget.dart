import 'package:flutter/material.dart';
import 'package:mheecha/profile_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  static List<Widget> _children = <Widget>[
    Text('Home'),
    Text('Messages'),
    new Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/mheecha_logo.png',
          height: 48.0,
          width: 36.0,
        ),
        // backgroundColor: Colors.white,
        titleSpacing: 8.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'Anna Alvarado',
                style: TextStyle(
                  fontFamily: 'Acme',
                  fontSize: 16.0,
                ),
              ),
              accountEmail: Text(
                'anna@gmail.com',
                style: TextStyle(
                  fontFamily: 'Acme',
                  fontSize: 14.0,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                image: new DecorationImage(
                  image: AssetImage('assets/images/drawer_background.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.blue.withOpacity(0.6), BlendMode.softLight),
                ),
              ),
              currentAccountPicture: new CircleAvatar(
                radius: 48.0,
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
              ),
            ),
            ListTile(
              title: Container(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.label),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text('Labels'),
                  ],
                ),
              ),
              onTap: () {
                // TODO Navigate based on List tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Container(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text('Calendar'),
                  ],
                ),
              ),
              onTap: () {
                // TODO Navigate based on List tap
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail), title: Text('Messages')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
