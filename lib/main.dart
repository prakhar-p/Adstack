import 'package:adstack/Home.dart';
import 'package:adstack/widgets/AppBar.dart';
import 'package:adstack/widgets/RightSidePanel.dart';
import 'package:adstack/widgets/SidePanel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isContentVisible = true;
  bool isRightPanelVisible = false;

  void toggleContentVisibility() {
    setState(() {
      isContentVisible = !isContentVisible;
      if (isContentVisible) {
        isRightPanelVisible = false;  // Hide right panel if content area is shown
      }
    });
  }

  void toggleRightPanelVisibility() {
    setState(() {
      isRightPanelVisible = !isRightPanelVisible;
      if (isRightPanelVisible) {
        isContentVisible = false;  // Hide content area if right panel is shown
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: ResponsiveAppBar(
        isMobile: isMobile,
        toggleContentVisibility: toggleContentVisibility,
        toggleRightPanelVisibility: toggleRightPanelVisibility,
      ),
      drawer: Drawer(
        child: SidePanel(),
      ),
      body: Row(
        children: [
          // Content Area
          if (!isMobile || isContentVisible) ...[
            Expanded(
              flex: 3,
              child: ContentArea(),
            ),
          ],

          // Right Side Panel
          if (!isMobile || isRightPanelVisible) ...[
            RightSidePanel(),
          ],
        ],
      ),
    );
  }
}


