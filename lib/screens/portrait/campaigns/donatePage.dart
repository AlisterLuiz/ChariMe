import 'package:ChariMe/models/npoModel.dart';
import 'package:ChariMe/screens/portrait/campaigns/paymentSuccessfulPage.dart';
import 'package:ChariMe/utilities/index.dart';

class DonatePagePortrait extends StatefulWidget {
  final String campaignName;
  final String charityName;
  final NPO npo;
  DonatePagePortrait({this.campaignName, this.charityName, this.npo});
  _DonatePagePortraitState createState() => _DonatePagePortraitState();
}

class _DonatePagePortraitState extends State<DonatePagePortrait> {
  TextEditingController amountController = new TextEditingController();
  TextEditingController merchantController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  String amount = '';
  String merchant = '';
  String username = '';
  String password = '';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getHeader(3, true, 'Donate', () => Navigator.pop(context)),
              Text(
                'Donating To',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              sizedBox(10, 0),
              Text(
                widget.campaignName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              sizedBox(10, 0),
              Text(
                'Run By',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              sizedBox(10, 0),
              getCharityRow(context, widget.npo),
              Column(
                children: [
                  sizedBox(10, 0),
                  CustomTextField(
                    labelText: 'Amount',
                    controller: amountController,
                    type: TextInputType.text,
                    func: (value) {
                      setState(
                        () {
                          amount = value;
                        },
                      );
                    },
                  ),
                  sizedBox(15, 0),
                  CustomTextField(
                    labelText: 'Amazon Merchant ID',
                    controller: merchantController,
                    type: TextInputType.number,
                    func: (value) {
                      setState(
                        () {
                          merchant = value;
                        },
                      );
                    },
                  ),
                  sizedBox(15, 0),
                  CustomTextField(
                    labelText: 'Username',
                    controller: usernameController,
                    type: TextInputType.text,
                    func: (value) {
                      setState(
                        () {
                          username = value;
                        },
                      );
                    },
                  ),
                  sizedBox(15, 0),
                  CustomTextField(
                    labelText: 'Password',
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    func: (value) {
                      setState(
                        () {
                          password = value;
                        },
                      );
                    },
                  ),
                  sizedBox(15, 0),
                  getButton(
                    context,
                    'PAY',
                    () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentSuccessfulPortrait(
                            campaignName: widget.campaignName,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
