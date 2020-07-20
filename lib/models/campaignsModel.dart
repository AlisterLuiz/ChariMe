import 'package:flutter/cupertino.dart';

class Campaigns {
  String campTitle;
  String campDescription;
  String hostedByNPO;
  bool isActive;
  double totalMoneyRaised;
  String region;
  String bannerImage;
  String npoProfile;
  Campaigns({
    @required this.campTitle,
    @required this.campDescription,
    @required this.hostedByNPO,
    @required this.isActive,
    @required this.totalMoneyRaised,
    @required this.region,
    @required this.bannerImage,
    this.npoProfile
  });
}
