import 'package:animdribb/configs/assets.dart';
import 'package:animdribb/configs/data.dart';
import 'package:animdribb/screens/trip_detail_screen.dart';
import 'package:animdribb/screens/widgets/trip_user_profile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TripDetailScreen(
            trip: headerTrip,
          ),
        ),
      ),
      child: Container(
        height: height * 0.3,
        width: width * 0.9,
        margin: EdgeInsets.symmetric(horizontal: width * 0.05),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: CachedNetworkImageProvider(headerTrip.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Positioned(
              bottom: height * 0.05,
              left: 24,
              right: 24,
              top: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headerTrip.duration,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const Gap(16),
                  SizedBox(
                    width: width * 0.6,
                    child: Text(
                      headerTrip.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 24,
              right: 24,
              bottom: -25,
              child: SizedBox(
                height: 50,
                child: Stack(
                  children: [
                    ...List.generate(
                      Assets.profiles.length,
                      (index) => TripUserProfile(index: index),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
