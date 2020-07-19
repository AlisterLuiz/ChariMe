import 'package:ChariMe/utilities/index.dart';

class PaymentSuccessfulPortrait extends StatelessWidget {
  final String campaignName;
  PaymentSuccessfulPortrait({this.campaignName});
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
          height: screenHeight(context),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              getHeader(3, false, 'Payment Successful', null),
              Expanded(
                flex: 8,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Theme.of(context).accentColor,
                        size: 150,
                      ),
                      sizedBox(10, 0),
                      Text(
                        'You have successfully donated to',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        campaignName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Campaign',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizedBox(15, 0),
                      Text(
                        'Thank You!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizedBox(10, 0),
                      getButton(
                        context,
                        'CONTINUE',
                        () async {
                          Navigator.pushNamed(
                              context, Routes.navigationScreenPortrait);
                        },
                      ),
                      sizedBox(15, 0),
                      Text(
                        'Payment powered by',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sizedBox(5, 0),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-original-577x577/s3/032018/untitled-1_160.png?psgIJ138upEREirwpsCHeZB3KAkA8kKz&itok=Z5umSeva',
                          height: 70,
                          width: 100,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
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
