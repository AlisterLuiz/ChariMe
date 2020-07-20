import 'package:ChariMe/models/npoModel.dart';
import 'package:ChariMe/utilities/index.dart';

Container getCharitiesList(
    BuildContext context, Function setState, List<NPO> npo) {
  return Container(
    height: screenHeight(context) * 0.25,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: npo.length,
      itemBuilder: (BuildContext context, int index) {
        return getCharityCard(context, npo[index]);
      },
    ),
  );
}

FittedBox getCharityCard(BuildContext context, NPO npo) {
  return FittedBox(
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharityScreenPortrait(
              charityBanner: npo.bannerPicture,
              charityImage: npo.profilePicture,
              charityName: npo.name,
              desc: npo.npoDescription,
              moneyRaised: npo.totalMoneyRaised,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    child: Image(
                      image: NetworkImage(
                        npo.bannerPicture,
                      ),
                      fit: BoxFit.cover,
                      width: 150,
                    ),
                  ),
                  sizedBox(30, 0),
                  Center(
                    child: AutoSizeText(
                      npo.name,
                      maxLines: 2,
                      style: TextStyle(
                        // fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: 35,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 60,
                width: 60,
                child: Card(
                  elevation: 2,
                  shape: CircleBorder(),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(npo.profilePicture),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
