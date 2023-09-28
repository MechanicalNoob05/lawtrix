import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb; // Import the kIsWeb constant
import 'package:lawtrix/components/navigation_drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Weba extends StatefulWidget {
  const Weba({Key? key}) : super(key: key);

  @override
  State<Weba> createState() => _WebaState();
}

class _WebaState extends State<Weba> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    try{
    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/') && kIsWeb) {
            // Only prevent navigation on the web
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(Uri.parse('https://huggingface.co/spaces/CamodDew/youtubelegal'));
    _controller = controller;
    }catch(e){
      _launchUrl();
    }


    // Conditionally call _launchUrl on the web
    // if (kIsWeb) {
    //   _launchUrl();
    // }
  }

  // Define the _launchUrl function
  void _launchUrl() {
    // Add your web-specific code here
    print('Launching URL on the web');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LawTrixBot')),
      body: WebViewWidget(controller: _controller),
      drawer: NavDrawer(),
    );
  }
}
