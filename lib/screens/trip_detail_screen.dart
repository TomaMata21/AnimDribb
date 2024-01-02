import 'package:animdribb/configs/assets.dart';
import 'package:animdribb/model/trip.dart';
import 'package:animdribb/screens/widgets/user_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TripDetailScreen extends StatelessWidget {
  const TripDetailScreen({
    super.key,
    required this.trip,
  });

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
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
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                bottom: height * 0.1,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag:"duration",
                    child: Text(
                      trip.duration,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Gap(12),
                  SizedBox(
                    width: width * 0.6,
                    child: Hero(
                      tag:"name",
                      child: Text(
                        trip.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Gap(12),
                  Wrap(
                    runSpacing: 8,
                    spacing: 12,
                    children: List.generate(
                      trip.users.length,
                      (index) => UserCard(
                        index: index,
                        trip: trip,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
