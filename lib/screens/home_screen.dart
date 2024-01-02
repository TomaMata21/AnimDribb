import 'package:animdribb/configs/assets.dart';
import 'package:animdribb/configs/data.dart';
import 'package:animdribb/screens/widgets/home_header.dart';
import 'package:animdribb/screens/widgets/trip_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
        ),
        actions: [
          Container(
            height: 45,
            width: 45,
            decoration: const BoxDecoration(
              color: Colors.deepOrangeAccent,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(Assets.profile),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
            child: Text(
              "Your trips",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Text(
              "Current trip".toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Gap(4),
          const HomeHeader(),
          const Gap(36),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: width * 0.02,
              children: trips
                  .map(
                    (trip) => TripCard(trip: trip),
                  )
                  .toList(),
            ),
          ),
          const Gap(36),
        ],
      ),
    );
  }
}
