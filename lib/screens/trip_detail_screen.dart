import 'package:animdribb/configs/assets.dart';
import 'package:animdribb/model/trip.dart';
import 'package:animdribb/screens/widgets/bg_overlay.dart';
import 'package:animdribb/screens/widgets/trip_detail_page_header.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TripDetailScreen extends StatelessWidget {
  const TripDetailScreen({
    super.key,
    required this.trip,
  });

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.all(4),
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.close,
                  color: Colors.black87,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            height: 45,
            width: 45,
            margin: const EdgeInsets.all(4),
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
      body: SizedBox(
        width: width,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Hero(
              tag: "bg",
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(trip.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Hero(
              tag: "bgOverlay",
              child: BgOverlay(),
            ),
            TripDetailPageHeader(trip: trip),
          ],
        ),
      ),
    );
  }
}
