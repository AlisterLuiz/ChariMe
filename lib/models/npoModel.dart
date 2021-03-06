import 'package:flutter/cupertino.dart';

class NPO{
  String username;
  String name;
  String region;
  double totalMoneyRaised;
  int numActiveCampaigns;       // active : current campaigns
  int numInactiveCampaigns;     // inactive : successful campaigns
  String npoDescription;
  String profilePicture;
  String bannerPicture;
  NPO({
    @required this.username,
    @required this.name,
    @required this.region,
    @required this.totalMoneyRaised,
    @required this.numActiveCampaigns,
    @required this.numInactiveCampaigns,
    @required this.npoDescription,
    @required this.profilePicture,
    @required this.bannerPicture,
});
}