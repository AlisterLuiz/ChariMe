import 'package:ChariMe/services/addNewCampaign.dart';
import 'package:ChariMe/providers/usernameProvider.dart';
import 'package:ChariMe/utilities/index.dart';

class AddNewCampaignPortrait extends StatefulWidget {
  @override
  _AddNewCampaignPortraitState createState() => _AddNewCampaignPortraitState();
}

class _AddNewCampaignPortraitState extends State<AddNewCampaignPortrait> {
  File _image;
  final picker = ImagePicker();
  String campaignName = "";
  String description = "";


  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Widget build(BuildContext context) {
    String username = Provider.of<UserNameProvider>(context, listen: false).getUsername();
    print(username);
    return SafeArea(

      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Container(
            height: screenHeight(context),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getHeader(
                  3,
                  true,
                  'New Campaign',
                  () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  flex: 10,
                  child: ListView(
                    children: [
                      Center(
                        child: _image == null
                            ? Container(
                                height: screenHeight(context) * 0.32,
                                width: screenWidth(context),
                                child: Center(
                                  child: Text(
                                    "No Image Selected",
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              )
                            : Image.file(
                                _image,
                                height: screenHeight(context) * 0.32,
                                width: screenWidth(context),
                              ),
                      ),
                      sizedBox(15, 0),
                      FloatingActionButton(
                        onPressed: getImage,
                        child: Icon(
                          Icons.add_a_photo,
                          color: Theme.of(context).buttonColor,
                        ),
                      ),
                      sizedBox(10, 0),
                      CustomTextField(
                        labelText: 'Campaign Name',
                        type: TextInputType.text,
                        func: (value) {
                          setState(
                                () {
                              campaignName = value;
                            },
                          );
                        },
                      ),
                      sizedBox(15, 0),
                      CustomTextField(
                        labelText: 'Description',
                        type: TextInputType.text,
                        func: (value) {
                          setState(
                                () {
                              description = value;
                            },
                          );
                        },
                      ),
                      sizedBox(15, 0),
                      getButton(
                        context,
                        'SUBMIT',
                        () async {
                          addCampaign(username, campaignName, description);
                          var res = await uploadImage(_image, campaignName, 'campaigns');
                          Navigator.pop(context);
                        },
                      ),
                      sizedBox(30, 0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
