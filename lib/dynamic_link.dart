import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';

class DynamicLinkProvider {
  Future<String> createLink(String refCode) async {
    final String url = "https://com.example.health_hub?ref=$refCode";

    final DynamicLinkParameters parameters = DynamicLinkParameters(
        androidParameters: const AndroidParameters(
            packageName: 'com.example.health_hub', minimumVersion: 0),
        link: Uri.parse(url),
        uriPrefix: "https://mdplanner.page.link");

    final FirebaseDynamicLinks link = FirebaseDynamicLinks.instance;
    final refLink = await link.buildShortLink(parameters);

    return refLink.shortUrl.toString();
  }

  void initDynamicLink() async {
    final instanceLink = await FirebaseDynamicLinks.instance.getInitialLink();

    if (instanceLink != null) {
      final Uri refLink = instanceLink.link;

      Share.share(
          "Ai fost invitat de catre: ${refLink.queryParameters["ref"]}");
    }
  }
}
