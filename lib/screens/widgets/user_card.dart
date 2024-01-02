import 'package:animdribb/model/trip.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.trip, required this.index});

  final Trip trip;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: trip.users[index].profileUrl,
      child: Material(
        type: MaterialType.transparency,
        child: Chip(
          backgroundColor: Colors.grey.shade800,
          shape: const StadiumBorder(),
          side: const BorderSide(color: Colors.transparent),
          avatar: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              trip.users[index].profileUrl,
            ),
          ),
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              trip.users[index].name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
