import 'package:flutter/material.dart';
import 'fab_bottom_layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // root of application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'starbucket',
      theme: ThemeData(primaryColor: Colors.green),
      home: MyHomePage(title: '星爸爸'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _lastSelected = '选择页面: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = '页面: $index';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          _lastSelected,
          style: TextStyle(fontSize: 32.0),
        ),
      ),
      bottomNavigationBar: FABBottomAppBar(
        // no content at center docker
        //centerItemText: '',
        color: Colors.grey[900],
        selectedColor: Colors.green,
        notchedShape: CircularNotchedRectangle(),
        onTabselected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.star, text: '首页'),
          FABBottomAppBarItem(iconData: Icons.card_giftcard, text: '福利购'),
          FABBottomAppBarItem(iconData: Icons.mail_outline, text: '星消息'),
          FABBottomAppBarItem(iconData: Icons.credit_card, text: '我'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.slow_motion_video),
        //elevation: 2.0,
        backgroundColor: Colors.green,
      ),
    );
  }
}
