import 'package:animdribb/screens/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../model/trip.dart';

class TripDetailPageHeader extends StatelessWidget {
  const TripDetailPageHeader({
    super.key,
    required this.trip,
    required this.offset,
  });
  final Trip trip;
  final double offset;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Align(
      alignment: FractionalOffset(0, 1 - offset),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            bottom: height * 0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: "duration",
                child: Text(
                  trip.duration,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Color.lerp(Colors.white, Colors.black, offset),
                      ),
                ),
              ),
              const Gap(12),
              SizedBox(
                width: width * 0.6,
                child: Hero(
                  tag: "name",
                  child: Text(
                    trip.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Color.lerp(Colors.white, Colors.black, offset),
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
      ),
    );
  }
}
