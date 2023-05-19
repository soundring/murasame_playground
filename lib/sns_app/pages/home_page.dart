// Flutter imports:
import 'package:flutter/material.dart';

const minCrossAxisWidth = 150.0;

class SnsAppHomePage extends StatelessWidget {
  const SnsAppHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = (screenWidth / minCrossAxisWidth).round();

    return Scaffold(
      backgroundColor: const Color(0xFFDEDDD3),
      appBar: AppBar(
        title: const Text('グループSNSアプリ'),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFFFF7939),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('所属グループ一覧'),
                Divider(color: Colors.black),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: 1,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12),
                  itemCount: 18,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 100,
                      height: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        color: Colors.orangeAccent,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                  child: Center(child: Text('グループ名$index'))),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'ラベル',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
