import 'package:animdribb/configs/assets.dart';
import 'package:animdribb/model/user.dart';

class Trip {
  final String name;
  final String duration;
  final String imageUrl;
  List<User> users;

  Trip({
    required this.name,
    required this.duration,
    required this.imageUrl,
  }) : users = [
          User(name: "Anne", profileUrl: Assets.profiles[0]),
          User(name: "Mike", profileUrl: Assets.profiles[1]),
          User(name: "Eric", profileUrl: Assets.profiles[2]),
        ];
}
