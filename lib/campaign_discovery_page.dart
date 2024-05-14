import 'package:flutter/material.dart';
import 'scrollable_feed.dart';
import 'create_campaign_page.dart';

class CampaignDiscoveryPage extends StatefulWidget {
  @override
  _CampaignDiscoveryPageState createState() => _CampaignDiscoveryPageState();
}

class _CampaignDiscoveryPageState extends State<CampaignDiscoveryPage> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> _campaigns = [];

  static List<Widget> _widgetOptions = <Widget>[
    ScrollableFeed(campaigns: []),
    const Text('Explore Campaigns'), // Placeholder for Explore Campaign page
    Placeholder(), // Placeholder for Create Campaign page
    const Text('Wallet'), // Placeholder for Wallet page
    const Text('Profile'), // Placeholder for Profile page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCampaignCreated(Map<String, dynamic> newCampaign) {
    setState(() {
      _campaigns.add(newCampaign);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DeeDz',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Handle campaign updates
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: _selectedIndex == 0
            ? ScrollableFeed(campaigns: _campaigns)
            : _selectedIndex == 2
                ? CreateCampaignPage(onCampaignCreated: _onCampaignCreated)
                : _widgetOptions.elementAt(_selectedIndex),
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
