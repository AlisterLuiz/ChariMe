import 'package:ChariMe/utilities/index.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amazon Pay Portal'),
      ),
      body: WebView(
        initialUrl:
            'https://www.amazon.com/ap/signin?openid.pape.preferred_auth_policies=http%3A%2F%2Fschemas.amazon.com%2Fpape%2Fpolicies%2F2010%2F05%2Fsingle-factor-strong&openid.pape.max_auth_age=900&openid.return_to=https%3A%2F%2Fpayments.amazon.com%2Fjr%2Fyour-account%2Fvalidatecallback%3Fredirect_to%3Dhttps%253A%252F%252Fpayments.amazon.com%252Fjr%252Fyour-account%252Forders%253Flanguage%253Den_US%2526ld%253DNSGoogle&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=amzn_payments&openid.mode=checkid_setup&marketPlaceId=AZ4B0ZS3LGLX&language=en_US&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&pageId=amzn_payments&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&&openid.assoc_handle=amzn_payments&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.mode=logout&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&openid.return_to=https%3A%2F%2Fwww.amazon.com%2Fap%2Fsignin%3Fopenid.pape.preferred_auth_policies%3Dhttp%253A%252F%252Fschemas.amazon.com%252Fpape%252Fpolicies%252F2010%252F05%252Fsingle-factor-strong%26openid.pape.max_auth_age%3D900%26openid.return_to%3Dhttps%253A%252F%252Fpayments.amazon.com%252Fjr%252Fyour-account%252Fvalidatecallback%253Fredirect_to%253Dhttps%25253A%25252F%25252Fpayments.amazon.com%25252Fjr%25252Fyour-account%25252Forders%25253Flanguage%25253Den_US%252526ld%25253DNSGoogle%26openid.identity%3Dhttp%253A%252F%252Fspecs.openid.net%252Fauth%252F2.0%252Fidentifier_select%26openid.assoc_handle%3Damzn_payments%26openid.mode%3Dcheckid_setup%26marketPlaceId%3DAZ4B0ZS3LGLX%26language%3Den_US%26openid.claimed_id%3Dhttp%253A%252F%252Fspecs.openid.net%252Fauth%252F2.0%252Fidentifier_select%26pageId%3Damzn_payments%26openid.ns%3Dhttp%253A%252F%252Fspecs.openid.net%252Fauth%252F2.0%26&',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
