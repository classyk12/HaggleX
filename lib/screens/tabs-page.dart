import 'package:flutter/material.dart';
import 'package:haggle_clone/widgets/navigation-bar-item.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          for (final tabItem in TabNavigationItem.items) tabItem.page,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 15.0,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xff2E1963),
        unselectedLabelStyle: TextStyle(color: Colors.black, fontSize: 12),
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
        items: [
          for (final tabItem in TabNavigationItem.items)
            BottomNavigationBarItem(
                //  backgroundColor: Colors.white,
                icon: tabItem.icon,
                // ignore: deprecated_member_use
                title: Text(
                  tabItem.title,
                  style: TextStyle(
                      // color: Colors.gret[900],
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ))
        ],
      ),
    );
  }
}
