import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../data/model/podcast_model.dart';

class PodcastDetailsViewVideoBylink extends StatefulWidget {
  final PodcastModel audio;

  const PodcastDetailsViewVideoBylink({super.key, required this.audio});

  @override
  PodcastDetailsViewVideoBylinkState createState() =>
      PodcastDetailsViewVideoBylinkState();
}

class PodcastDetailsViewVideoBylinkState
    extends State<PodcastDetailsViewVideoBylink> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
   _controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onHttpError: (HttpResponseError error) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse(widget.audio.url));
  }


  @override
  void dispose() {
    _controller.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  WebViewWidget(controller: _controller);
  }
}
