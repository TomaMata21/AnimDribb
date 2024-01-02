import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TripCommentItem extends StatelessWidget {
  const TripCommentItem({
    super.key,
    required this.profile,
    required this.content,
  });

  final String profile;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(profile),
          ),
          const Gap(8),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1,
                ),
              ),
              child: Text(
                content,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
