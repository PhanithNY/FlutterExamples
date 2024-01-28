import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(),
      home: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        navigationBar: CupertinoNavigationBar(
          middle: Text("Navigation Title"),
        ),
        child: SafeArea(
          maintainBottomViewPadding: false,
          bottom: false,
          child: ListView(
            children: List.generate(30, (index) => MyCupertinoListView()),
          ),
        ),
      ),
    );
  }
}

class MyCupertinoListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
    children: List.generate(3, (index) => CupertinoListTile(
              title: const Text('Open pull request'),
              leading: Container(
                width: double.infinity,
                height: double.infinity,
                color: CupertinoColors.activeGreen,
              ),
              trailing: const CupertinoListTileChevron(),
              onTap: () => Navigator.of(context).push(
                CupertinoPageRoute<void>(
                  builder: (BuildContext context) {
                    return const _SecondPage(text: 'Open pull request');
                  },
                ),
              ),
            ),
        ),

      header: Container(
        child: Text("Header", style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: CupertinoColors.secondaryLabel),),
      ),
      // footer: Container(
      //   alignment: Alignment.bottomRight,
      //   child: Text("Footer"),
      // ),
    );
  }
}

class _SecondPage extends StatelessWidget {
  const _SecondPage({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Text(text),
      ),
    );
  }
}