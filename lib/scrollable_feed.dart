import 'package:flutter/material.dart';

class ScrollableFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20, // Replace with actual number of campaign items
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            'Campaign $index',
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
          subtitle: Text(
            'Campaign description goes here',
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
          onTap: () {
            // Handle tapping on a campaign item
          },
        );
      },
    );
  }
}
