// import 'package:flutter/foundation.dart';

// Dart imports:
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import "package:universal_html/html.dart" as html;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String _viewId = 'model_viewer';

class ModelViewerHomePage extends HookWidget {
  const ModelViewerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    final modelUrl = useState(
        'https://sketchfab.com/models/b07d263a7ab942e6935e77cd75bf1194/embed');

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      _viewId,
      (int viewId) => html.IFrameElement()
        ..style.width = '100%'
        ..style.height = '100%'
        ..src = modelUrl.value
        ..style.border = 'none',
    );

    return Scaffold(
      appBar: AppBar(
          title: const Text('3Dモデルビュワー'),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFFFF7939)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '表示したい3DのURLを入力してください',
              ),
              onSubmitted: (value) {
                // 入力された値がURLとして有効かどうかを判定する
                final urlPattern = RegExp(
                    r'^https?:\/\/'
                    r'(?:www\.|(?!www))[^\s\.]+\.[^\s]{2,}\s*$',
                    caseSensitive: false,
                    multiLine: false);
                if (!urlPattern.hasMatch(value)) {
                  // 無効なURLの場合はエラーメッセージを表示して、何もしない
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          '有効なURLを入力してください',
                          style: TextStyle(color: Colors.white),
                        )),
                  );
                  return;
                }

                modelUrl.value = value;
                key.currentState?.build(context);
              },
            ),
          ),
          Expanded(
            child: SizedBox.expand(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: HtmlElementView(
                  key: key,
                  viewType: _viewId,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    // final screenWidth = MediaQuery.of(context).size.width;
    // final isTablet = screenWidth > 600;
    // final WebViewController controller = WebViewController();
    // controller
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setBackgroundColor(Colors.white)
    //   ..loadRequest(Uri.parse('https://playcanv.as/p/1elceD1v/'));
    //
    // return Scaffold(
    //   appBar: AppBar(
    //       title: const Text('3Dモデルビュワー'),
    //       foregroundColor: Colors.white,
    //       backgroundColor: const Color(0xFFFF7939)),
    //   body: Center(
    //     child: SizedBox(
    //       width: isTablet ? screenWidth * 0.5 : screenWidth,
    //       child: WebViewWidget(controller: controller),
    //     ),
    //   ),
    // );
  }
}
