import 'package:animdribb/configs/assets.dart';
import 'package:animdribb/screens/widgets/bg_overlay.dart';
import 'package:animdribb/screens/widgets/trip_comment_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:gap/gap.dart';

class TripDetailPageViewItem extends StatelessWidget {
  const TripDetailPageViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: height * 0.3),
          SizedBox(
            width: width * 0.9,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.43,
                    height: height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: const DecorationImage(
                        image: CachedNetworkImageProvider(Assets.image1),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        const BgOverlay(borderRadius: 4),
                        Positioned(
                          top: 8,
                          bottom: 8,
                          left: 12,
                          right: 12,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CEO SUMMARY",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              const Spacer(),
                              Text(
                                "1,568 km",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: Colors.white70,
                                    ),
                              ),
                              const Gap(8),
                              Text(
                                "Check 11 days",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: width * 0.43,
                    height: height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: const DecorationImage(
                        image: CachedNetworkImageProvider(Assets.image2),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        const BgOverlay(borderRadius: 4),
                        Positioned(
                          top: 8,
                          bottom: 8,
                          left: 12,
                          right: 12,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "MEDIA",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              const Spacer(),
                              Text(
                                "257",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: Colors.white70,
                                    ),
                              ),
                              const Gap(4),
                              Text(
                                "Photos",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              const Gap(8),
                              Text(
                                "14",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: Colors.white70,
                                    ),
                              ),
                              const Gap(4),
                              Text(
                                "Videos",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(8),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("TRIP BOARD",
                  style: Theme.of(context).textTheme.bodyMedium!),
            ),
          ),
          const Gap(8),
          TripCommentItem(
            profile: Assets.profiles[0],
            content: lorem(
              paragraphs: 1,
              words: 10,
            ),
          ),
          TripCommentItem(
            profile: Assets.profiles[1],
            content: lorem(
              paragraphs: 1,
              words: 15,
            ),
          ),
        ],
      ),
    );
  }
}
