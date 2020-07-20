import 'package:ChariMe/models/npoModel.dart';
import 'package:ChariMe/utilities/index.dart';

Container getCampaignsList(BuildContext context, Function setState, List list) {
  return Container(
    height: screenHeight(context) * 0.3,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return getCampaignCard(context, list[index]);
      },
    ),
  );
}

FittedBox getCampaignCard(BuildContext context, Campaigns campaign) {
  return FittedBox(
    child: InkWell(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FutureBuilder<NPO>(
              future: getNpoDetails(campaign.hostedByNPO),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? CampaignScreenPortrait(
                        campaignImage: campaign.bannerImage,
                        campaignName: campaign.campTitle,
                        npo: snapshot.data,
                        desc: campaign.campDescription,
                        moneyRaised: campaign.totalMoneyRaised,
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(5.0),
            width: 150.0,
            child: Card(
              color: Theme.of(context).cardColor,
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              elevation: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: NetworkImage(
                      campaign.bannerImage,
                    ),
                    fit: BoxFit.cover,
                    width: 150,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        sizedBox(2, 0),
                        Text(
                          campaign.hostedByNPO,
                          style: TextStyle(
                            fontSize: 11,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        AutoSizeText(
                          campaign.campTitle,
                          maxLines: 2,
                          style: TextStyle(
                            // fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        sizedBox(2, 0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
