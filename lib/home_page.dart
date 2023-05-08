// Flutter imports:
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// Package imports:
import 'package:go_router/go_router.dart';

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
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('作ったもの一覧'),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFFFF7939),
      ),
      body: Column(
        children: [
          const Gap(20),
          const Text('PWA対応　随時開発中'),
          const Gap(20),
          const Text('環境', style: TextStyle(fontSize: 20)),
          Table(
            border: TableBorder.all(
              color: Colors.black,
              width: 1,
              style: BorderStyle.solid,
            ),
            children: const [
              TableRow(
                children: [
                  Center(child: Text('Flutterのバージョン')),
                  Center(child: Text('3.7.10')),
                ],
              ),
              TableRow(
                children: [
                  Center(child: Text('Dartのバージョン')),
                  Center(child: Text('>=2.19.6 <3.0.0')),
                ],
              ),
            ],
          ),
          const Gap(20),
          const Text('アプリ一覧',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
              itemCount: _productList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: _productList[index]['accessible'] == 'false'
                      ? Colors.grey
                      : Colors.white,
                  child: ListTile(
                      title: Text(
                        _productList[index]['name']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        if (_productList[index]['accessible'] == 'false') {
                          return;
                        }

                        context.push(_productList[index]['path']!);
                      },
                      subtitle: (_productList[index]['accessible'] == 'true')
                          ? const Text('タップでアプリへ移動')
                          : const Text('現在開発中です')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
