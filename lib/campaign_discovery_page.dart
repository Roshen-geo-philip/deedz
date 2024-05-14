import 'package:flutter/material.dart';
import 'scrollable_feed.dart'; // Assuming you have already implemented ScrollableFeed widget
import 'create_campaign_page.dart';
import 'explore_campaign_page.dart';
import 'wallet_page.dart';
import 'profile_page.dart';

class CampaignDiscoveryPage extends StatefulWidget {
  @override
  _CampaignDiscoveryPageState createState() => _CampaignDiscoveryPageState();
}

class _CampaignDiscoveryPageState extends State<CampaignDiscoveryPage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    ScrollableFeed(),
    ExploreCampaignPage(),
    CreateCampaignPage(),
    WalletPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DeeDz',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Handle campaign updates
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
