import 'package:animdribb/configs/assets.dart';
import 'package:animdribb/configs/data.dart';
import 'package:animdribb/screens/trip_detail_screen.dart';
import 'package:animdribb/screens/widgets/bg_overlay.dart';
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
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (_, animation, __) {
            return TripDetailScreen(
              trip: headerTrip,
            );
          },
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      child: Container(
        height: height * 0.4,
        width: width * 0.9,
        margin: EdgeInsets.symmetric(horizontal: width * 0.05),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Hero(
              tag: "bg",
              child: Container(
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(headerTrip.imageUrl),
                  fit: BoxFit.cover,
                ),
              )),
            ),
            const Hero(
              tag: "bgOverlay",
              child: BgOverlay(),
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
                  Hero(
                    tag: "duration",
                    child: Text(
                      headerTrip.duration,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  const Gap(16),
                  SizedBox(
                    width: width * 0.6,
                    child: Hero(
                      tag: "name",
                      child: Text(
                        headerTrip.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
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
