import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../InfoMode.dart';
import 'package:flutter/gestures.dart';
import '../webview/webview.dart';
import 'package:flutter/services.dart';

class FirstVC extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '关注'),
    Tab(text: '推荐'),
    Tab(text: '热榜'),
    Tab(text: '快讯'),
    Tab(text: '视频'),
    Tab(text: '科技'),
  ];

  final TabController _tabController =
      TabController(length: 6, vsync: ScrollableState());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
          child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.date_range,
                        color: Colors.blue,
                        size: 25,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: MediaQuery.of(context).size.width - 10 * 3 - 25,
                  height: 25,
                  child: GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Container(
                        height: 25,
                        color: Color(0x99CBCBCB),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.search),
                            Text('大家都在搜iPhone降价'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: new EdgeInsets.only(top: 0),
              labelStyle: new TextStyle(fontSize: 16.0),
              unselectedLabelStyle: new TextStyle(fontSize: 12.0),
              controller: _tabController,
              tabs: myTabs,
              isScrollable: true,
            ),
          ],
        ),
      )),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          if (tab.text == '快讯') {
            return FastInfoVC();
          } else {
            return new Center(child: new Text(tab.text));
          }
        }).toList(),
      ),
    );
  }
}

class FastInfoVC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FastState();
  }
}

final fastInfoList = List();

class FastState extends State<FastInfoVC> {
  @override
  void initState() {
    super.initState();
    _requestFastInfo('0');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: fastInfoList.length,
        itemBuilder: (context, index) {
          InfoMode currentMode = fastInfoList[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10),
                child: SizedBox(
                  child: Text(
                    currentMode.dateTitle ?? '',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  width: 40,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 2,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width - 94,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              currentMode.title,
                              softWrap: true,
                              maxLines: 2,
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                  currentMode.isDisplay == null ||
                                          currentMode.isDisplay == false
                                      ? 0
                                      : 20),
                              color: Color.fromARGB(255, 223, 226, 230),
                              child: currentMode.isDisplay == null ||
                                      currentMode.isDisplay == false
                                  ? Container()
                                  : Text.rich(
                                      TextSpan(
                                        text: currentMode.isDisplay == null ||
                                                currentMode.isDisplay == false
                                            ? ""
                                            : currentMode.description,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '原文链接',
                                              style:
                                                  TextStyle(color: Colors.blue),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Navigator.of(context).push(
                                                      new MaterialPageRoute(
                                                          builder: (_) {
                                                    return WebView(
                                                      title: currentMode.title,
                                                      url: currentMode.newsUrl,
                                                    );
                                                  }));
                                                }),
                                        ],
                                      ),
                                    ),
                            )
                          ],
                        )),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 94,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentMode.isDisplay = !currentMode.isDisplay;
                              });
                            },
                            child: Text(
                                currentMode.isDisplay == null ||
                                        currentMode.isDisplay == false
                                    ? "展开"
                                    : "收起",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                )),
                          ),
                          Expanded(
                              child: Container(
                                  child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.chat,
                                  color: Colors.grey,
                                  size: 16,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.share,
                                  color: Colors.grey,
                                  size: 16,
                                ),
                              )
                            ],
                          )))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }

  _requestFastInfo(String infoId) async {
    try {
      if (infoId == '0') {
        String url = "https://36kr.com/api/newsflash?per_page=10";
        final response = await http.get(url);
        final Map<String, dynamic> responseDataMap = jsonDecode(response.body);
        if (responseDataMap != null && responseDataMap['code'] == 0) {
          List tempList = List();
          for (var item in responseDataMap['data']['items']) {
            InfoMode tempMode = InfoMode(item);
            tempList.add(tempMode);
          }
          setState(() {
            fastInfoList.addAll(tempList);
          });
        }
      }
    } catch (e) {}
  }
}

class MAppBar extends StatefulWidget implements PreferredSizeWidget {
  MAppBar({@required this.child}) : assert(child != null);
  final Widget child;
  @override
  Size get preferredSize {
    return Size.fromHeight(88);
  }

  @override
  State createState() {
    return new MAppBarState();
  }
}

class MAppBarState extends State<MAppBar> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
