// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

// 作ったものの名前とURL
const _productList = <Map<String, String>>[
  {
    'name': 'Todoアプリ',
    'path': '/todo_app',
    'accessible': 'true',
  },
  {
    'name': 'ECアプリ',
    'path': '/ec_app',
    'accessible': 'true',
  },
  {
    'name': '3Dモデルビュワー',
    'path': '/model_viewer_app',
    'accessible': 'true',
  },
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Murasameのポートフォリオサイト'),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFFFF7939),
      ),
      body: Column(
        children: [
          const Gap(8),
          const CircleAvatar(
            maxRadius: 60,
            backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/14822782?v=4'),
          ),
          const Text(
            'Murasame',
            style: TextStyle(fontSize: 20),
          ),
          const Gap(8),
          const Text(
            'Web/Mobile App Developer',
            style: TextStyle(color: Colors.grey),
          ),
          const Gap(8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SnsButton(
                icon: FontAwesomeIcons.github,
                color: Colors.black,
                snsUrl: 'https://github.com/soundring',
              ),
              SnsButton(
                icon: FontAwesomeIcons.twitter,
                color: Colors.blue,
                snsUrl: 'https://twitter.com/murasame_rize',
              ),
            ],
          ),
          const Gap(8),
          const Text('最近、WebXRに可能性を感じています'),
          const Gap(20),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                const Text(
                  '作ったアプリ一覧',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final accessible =
                          _productList[index]['accessible'] == 'true';
                      final name = _productList[index]['name']!;
                      final path = _productList[index]['path']!;
                      return Card(
                        color: accessible ? Colors.white : Colors.grey,
                        child: ListTile(
                            title: Text(
                              name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              if (!accessible) {
                                return;
                              }

                              context.push(path);
                            },
                            subtitle: accessible
                                ? const Text('タップでアプリへ移動')
                                : const Text('現在開発中です')),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const Gap(20),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text('このサイトの環境', style: TextStyle(fontSize: 16)),
                  Table(
                    border: TableBorder.all(
                      color: Colors.black,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                    children: const [
                      TableRow(
                        children: [
                          Center(child: Text('Flutter')),
                          Center(child: Text('3.10.5')),
                        ],
                      ),
                      TableRow(
                        children: [
                          Center(child: Text('Dart')),
                          Center(child: Text('3.0.5')),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}

class SnsButton extends StatelessWidget {
  const SnsButton(
      {Key? key, required this.icon, required this.color, required this.snsUrl})
      : super(key: key);

  final IconData icon;
  final Color color;
  final String snsUrl;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      onPressed: _launchUrl,
      child: FaIcon(
        icon,
        color: color,
      ),
    );
  }

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(snsUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
