import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Web Page',
      home: MyTemplateWeb(),
    );
  }
}

class MyTemplateWeb extends StatelessWidget {
  const MyTemplateWeb({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Colors.grey, // Can be used to match the color with the content widget..
      body: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});
  @override
  Widget build(BuildContext context) {
    // Register height of content widgets here..
    double headerHeight = 80;
    double contentHeight = 400;
    double footerHeight = 100;
    return Stack(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            double screenHeight =
                constraints.maxHeight - (headerHeight + footerHeight);
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: screenHeight,
                ),
                child: Column(
                  children: [
                    MyHeader(height: headerHeight),
                    MyContents(height: contentHeight),

                    // Dynamic position of height space widgets..
                    if (contentHeight < screenHeight) ...[
                      SizedBox(height: screenHeight - contentHeight)
                    ],
                    MyFooter(height: footerHeight),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

class MyHeader extends StatelessWidget {
  final double height;
  const MyHeader({Key? key, required this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: height,
      child: const Center(
        child: Text(
          'Header Widget',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class MyContents extends StatelessWidget {
  final double height;
  const MyContents({Key? key, required this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // Put the content widgets here..
          Text('Content Widget'),
        ],
      ),
    );
  }
}

class MyFooter extends StatelessWidget {
  final double height;
  const MyFooter({Key? key, required this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: height,
      child: const Center(
        child: Text(
          'Footer Widget',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
