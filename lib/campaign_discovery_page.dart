import 'package:flutter/material.dart';
import 'scrollable_feed.dart';

class CampaignDiscoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DeeDz',
          style:
              TextStyle(color: Colors.white), // Set app bar text color to white
        ),
        backgroundColor: Colors.black, // Set app bar background color to black
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Handle campaign updates
            },
          ),
        ],
      ),
      backgroundColor: Colors.black, // Set background color to black
      body: ScrollableFeed(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            Colors.black, // Change bottom navigation bar color to black
        selectedItemColor: Colors.white, // Set selected item color to white
        unselectedItemColor: Colors.grey, // Set unselected item color to grey
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
