import 'package:flutter/material.dart';
import 'package:thyroidclass/subpage/homepage/HomeMedicine.dart';
import 'package:thyroidclass/subpage/homepage/HomeBloodTest.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        //color: Colors.red,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Image.asset("assets/images/welcome.jpeg"),
            SizedBox(
              height: 1.0,
            ),
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 10, top: 30, right: 10),
                child: new Column(children: <Widget>[
                  Text(
                    'How are you feeling today?\nTake a look and review the items listed below.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ])),
          ]),
        ),
      ),
    );
  }
}
