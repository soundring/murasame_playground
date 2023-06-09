import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:universal_html/html.dart" as html;
import 'dart:ui' as ui;

import 'package:webview_flutter/webview_flutter.dart';

const String _viewId = 'model_viewer';

class ModelViewerHomePage extends StatelessWidget {
  const ModelViewerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;

    if (kIsWeb) {
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
        _viewId,
        (int viewId) => html.IFrameElement()
          ..style.width = '${screenWidth}px'
          ..style.height = '${screenHeight}px'
          ..src =
              'https://sketchfab.com/models/9120703a4aee4c2cb0313a9ca3e1e1a3/embed'
          ..style.border = 'none',
      );

      return Scaffold(
        appBar: AppBar(
            title: const Text('3Dモデルビュワー'),
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFFFF7939)),
        body: Center(
          child: SizedBox(
            width: isTablet ? screenWidth * 0.5 : screenWidth,
            child: const HtmlElementView(
              viewType: _viewId,
            ),
          ),
        ),
      );
    }

    final WebViewController controller = WebViewController();
    controller.loadRequest(Uri.parse(
        'https://sketchfab.com/models/9120703a4aee4c2cb0313a9ca3e1e1a3/embed'));

    return Scaffold(
      appBar: AppBar(
          title: const Text('3Dモデルビュワー'),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFFFF7939)),
      body: WebViewWidget(controller: controller),
    );
  }
}
