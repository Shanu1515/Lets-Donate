import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
      name: 'WebInterface',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
      }),
].toSet();

class DonatePage extends StatefulWidget {
  static String title = 'Donate';

  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(DonatePage.title),
      ),
      url: 'https://givethem.netlify.app/donate',
      javascriptChannels: jsChannels,
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              width: 15,
            ),
            Text(
              "Please Wait....",
              style: TextStyle(color: Color(0xFF634075)),
            )
          ],
        ),
      ),
    );
  }
}
