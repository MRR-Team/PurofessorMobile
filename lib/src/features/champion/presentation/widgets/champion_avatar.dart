import 'package:flutter/material.dart';

class ChampionAvatar extends StatelessWidget {
  final String photoUrl;
  final double size;
  final double radius;

  const ChampionAvatar({
    super.key,
    required this.photoUrl,
    this.size = 32,
    this.radius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.network(
        photoUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/images/champion_placeholder.png',
            width: size,
            height: size,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
