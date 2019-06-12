import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

/// WebView
class WebView extends StatefulWidget {
  String title;
  String url;
  WebView({this.title, this.url});

  @override
  State<StatefulWidget> createState() {
    return _WebViewState();
  }
}

class _WebViewState extends State<WebView> {
  @override
  void initState() {
    super.initState();
    FlutterWebviewPlugin().onStateChanged.listen((WebViewStateChanged wvs) {
      print(wvs.type);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
        url: widget.url,
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          iconTheme: IconThemeData.fallback(),
          textTheme:
              TextTheme(title: TextStyle(color: Colors.black, fontSize: 20)),
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    FlutterWebviewPlugin().close();
    super.dispose();
  }
}
