import 'package:flutter/material.dart';

class BgOverlay extends StatelessWidget {
  const BgOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
      ),
    );
  }
}
