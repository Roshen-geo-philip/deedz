import 'package:flutter/material.dart';
import 'dart:io';

class ScrollableFeed extends StatelessWidget {
  final List<Map<String, dynamic>> campaigns;

  const ScrollableFeed({super.key, required this.campaigns});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: campaigns.length,
      itemBuilder: (BuildContext context, int index) {
        return CampaignTile(
          providerName: campaigns[index]['user'],
          imageUrl: campaigns[index]['image'],
          description: campaigns[index]['description'],
          timePosted: 'Just now', // You can change this to actual time
        );
      },
    );
  }
}

class CampaignTile extends StatelessWidget {
  final String providerName;
  final File imageUrl;
  final String description;
  final String timePosted;

  const CampaignTile({
    super.key,
    required this.providerName,
    required this.imageUrl,
    required this.description,
    required this.timePosted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            providerName,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Image.file(imageUrl),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.thumb_up, color: Colors.white),
                    onPressed: () {
                      // Handle upvote
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.thumb_down, color: Colors.white),
                    onPressed: () {
                      // Handle downvote
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.comment, color: Colors.white),
                    onPressed: () {
                      // Handle comment
                    },
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () {
                  // Handle share
                },
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            description,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 4.0),
          Text(
            timePosted,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
