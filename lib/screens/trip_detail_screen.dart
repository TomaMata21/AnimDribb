import 'package:animdribb/configs/assets.dart';
import 'package:animdribb/model/trip.dart';
import 'package:animdribb/screens/widgets/bg_overlay.dart';
import 'package:animdribb/screens/widgets/trip_detail_page_header.dart';
import 'package:animdribb/screens/widgets/trip_detail_pageview_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TripDetailScreen extends StatefulWidget {
  const TripDetailScreen({
    super.key,
    required this.trip,
  });

  final Trip trip;

  @override
  State<TripDetailScreen> createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends State<TripDetailScreen> {
  ValueNotifier<double> offsetNotifier = ValueNotifier(0);
  final _pageController = PageController();

  @override
  void initState() {
    _pageController.addListener(_pageListener);
    super.initState();
  }

  void _pageListener() {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final offsetValue = _pageController.offset / screenHeight;
    offsetNotifier.value = offsetValue.clamp(0, 1);
  }

  @override
  void dispose() {
    _pageController
      ..removeListener(_pageListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return ValueListenableBuilder(
        valueListenable: offsetNotifier,
        builder: (context, offsetValue, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              scrolledUnderElevation: 0,
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor:
                          Color.lerp(Colors.black26, Colors.white, offsetValue),
                    ),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      color:
                          Color.lerp(Colors.white, Colors.black, offsetValue),
                      size: 18,
                    ),
                  ),
                ],
              ),
              actions: [
                FadeTransition(
                  opacity: AlwaysStoppedAnimation(offsetValue),
                  child: IconButton(
                    icon: const CircleAvatar(
                      backgroundImage: AssetImage(Assets.profile),
                    ),
                    onPressed: () {},
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
                    child: FadeTransition(
                      opacity: AlwaysStoppedAnimation(1 - offsetValue),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                widget.trip.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Hero(
                    tag: "bgOverlay",
                    child: FadeTransition(
                      opacity: AlwaysStoppedAnimation(1 - offsetValue),
                      child: const BgOverlay(),
                    ),
                  ),
                  TripDetailPageHeader(
                    trip: widget.trip,
                    offset: offsetValue,
                  ),
                  PageView(
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    children: const [
                      SizedBox.shrink(),
                      TripDetailPageViewItem(),
                    ],
                  ),
                  Positioned(
                    bottom: 60,
                    right: -72 * (1 - offsetValue),
                    child: FadeTransition(
                      opacity: AlwaysStoppedAnimation(offsetValue),
                      child: Container(
                        height: 40,
                        width: 72,
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent.shade400,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
