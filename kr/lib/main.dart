import 'package:flutter/material.dart';
import 'view/FirstVC.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  String title;
  MyHomePage({this.title});
  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State {
  Widget _currentWidget = Container();
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      _currentWidget = FirstVC();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _currentWidget,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
              title: new Text("首页"),
              icon: new Icon(Icons.home,
                  color: _currentIndex == 0 ? Colors.blue : Colors.grey)),
          BottomNavigationBarItem(
              title: new Text("开氪"),
              icon: new Icon(Icons.list,
                  color: _currentIndex == 1 ? Colors.blue : Colors.grey)),
          BottomNavigationBarItem(
              title: new Text("发现"),
              icon: new Icon(Icons.find_in_page,
                  color: _currentIndex == 2 ? Colors.blue : Colors.grey)),
          BottomNavigationBarItem(
              title: new Text("创投"),
              icon: new Icon(Icons.attach_money,
                  color: _currentIndex == 3 ? Colors.blue : Colors.grey)),
          BottomNavigationBarItem(
              title: new Text("我的"),
              icon: new Icon(Icons.person,
                  color: _currentIndex == 4 ? Colors.blue : Colors.grey)),
        ],
      ),
    );
  }

  _onTap(int index) {
    switch (index) {
      case 0:
        _currentWidget = FirstVC();
        break;
      case 1:
        _currentWidget = SecondVC();
        break;
      case 2:
        _currentWidget = ThirdVC();
        break;
      case 3:
        _currentWidget = FourVC();
        break;
      case 4:
        _currentWidget = FiveVC();
        break;
      default:
    }
    setState(() {
      _currentIndex = index;
      _currentWidget = _currentWidget;
    });
  }
}



class SecondVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('11'),
      color: Colors.green,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}

class ThirdVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('11'),
      color: Colors.blue,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}

class FourVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('11'),
      color: Colors.purple,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}

class FiveVC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('11'),
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}

