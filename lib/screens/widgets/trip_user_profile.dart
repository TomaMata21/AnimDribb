import 'package:animdribb/configs/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TripUserProfile extends StatelessWidget {
  const TripUserProfile({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: index * 30,
      child: Hero(
        tag: Assets.profiles[index],
        child: Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(4.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(Assets.profiles[index]),
          ),
        ),
      ),
    );
  }
}
