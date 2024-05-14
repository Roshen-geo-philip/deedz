import 'package:flutter/material.dart';
import 'dart:io'; // Import the dart:io package

class ScrollableFeed extends StatelessWidget {
  final List<Map<String, dynamic>> campaigns;

  const ScrollableFeed({Key? key, required this.campaigns}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: campaigns.length,
      itemBuilder: (BuildContext context, int index) {
        final campaign = campaigns[index];
        final providerName = campaign['user'] ?? 'Unknown Provider'; // Provide a default value if null
        return CampaignTile(
          providerName: providerName,
          imageUrl: campaign['image'],
          description: campaign['description'],
          timePosted: campaign['timePosted'],
        );
      },
    );
  }
}

class CampaignTile extends StatelessWidget {
  final String providerName;
  final String imageUrl;
  final String description;
  final String timePosted;

  const CampaignTile({
    Key? key,
    required this.providerName,
    required this.imageUrl,
    required this.description,
    required this.timePosted,
  }) : super(key: key);

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
          imageUrl.startsWith('http')
              ? Image.network(imageUrl)
              : Image.file(File(imageUrl)),
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
