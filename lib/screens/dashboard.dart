import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_clone/helpers/mock-values.dart';
import 'package:haggle_clone/helpers/storage-helper.dart';
import 'package:haggle_clone/utils.dart/margin.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _index = 0;
  int _selectedvalue = 0;
  String username;

  @override
  Widget build(BuildContext context) {
    username = Storage.read('username');
    return Scaffold(
        body: ListView(
      // shrinkWrap: true,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          height: Get.height * 0.22,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet<void>(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                                height: Get.height * 0.1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Storage.remove('token');
                                      Storage.remove('username');
                                      Get.offAllNamed('/login');
                                    },
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.power_settings_new,
                                              color: Colors.red[600], size: 30),
                                          XMargin(5),
                                          Text('Logout',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        ]),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(3),
                          //  color: Colors.red,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              shape: BoxShape.circle,
                              color: Colors.transparent),
                          child: Container(
                              // margin: EdgeInsets.all(3),
                              //  padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  shape: BoxShape.circle,
                                  color: Color(0xffE9BBFF)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                    '${username.substring(0, 2).toUpperCase()}',
                                    style: TextStyle(
                                        color:
                                            Color(0xff2E1963).withOpacity(1.0),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              )),
                        ),
                      ),
                      Text('HaggleX',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold)),
                      Stack(alignment: Alignment.topRight, children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff7362A1).withOpacity(0.2)),
                          child: Center(
                            child: Icon(Icons.notifications,
                                color: Colors.white, size: 15),
                          ),
                        ),
                        Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                            child: Center(
                              child: Text('5',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11)),
                            ))
                      ])
                    ],
                  ),
                ),
                YMargin(20),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text('Total portfolio balance',
                      style: TextStyle(color: Colors.white, fontSize: 10)),
                ),
                YMargin(12),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _selectedvalue == 0
                          ? Text(r"$****",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400))
                          : RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'N0.00',
                                    style: TextStyle(
                                        fontFamily: 'BasisGrotesquePro',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                                WidgetSpan(
                                  child: Transform.translate(
                                    offset: const Offset(3, -18),
                                    child: Text(
                                      'NGN',
                                      //superscript is usually smaller in size
                                      textScaleFactor: 0.7,
                                      style: TextStyle(
                                          fontFamily: 'BasisGrotesquePro',
                                          color: Colors.white,
                                          fontSize: 12),
                                    ),
                                  ),
                                )
                              ]),
                            ),
                      // : Text("N0.00",
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 25,
                      //         fontWeight: FontWeight.w400)),
                      //cupertino
                      Container(
                        width: Get.width * 0.25,
                        padding: EdgeInsets.only(
                            left: 5, right: 5, top: 2, bottom: 2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: CupertinoSlidingSegmentedControl(
                            thumbColor: Color(0xffFFC175),
                            children: {
                              0: Text('USD',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8)),
                              1: Text('NGN',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8))
                            },
                            groupValue: _selectedvalue,
                            onValueChanged: (newValue) {
                              setState(() {
                                _selectedvalue = newValue;
                                print(_selectedvalue);
                              });
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

        //carousel
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            color: Color(0xFFF3F3F3),
            height: Get.height * 0.19,
            width: Get.width * 0.8, // card height
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: PageView(
                  controller: PageController(),
                  onPageChanged: (int index) => setState(() => _index = index),
                  children: [
                    Container(
                      width: Get.width * 0.7,
                      child: Image.asset('assets/images/card1.png'),
                    ),
                    Container(
                      width: Get.width * 0.7,
                      child: Image.asset('assets/images/card2.png'),
                    ),
                    Container(
                      width: Get.width * 0.7,
                      child: Image.asset('assets/images/card3.png'),
                    )
                  ]),
            ),
          ),
        ),

        Column(
          //  mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("Markets",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
            ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (BuildContext context, index) => Padding(
                padding: const EdgeInsets.all(3.0),
                child: new Divider(
                  color: Colors.grey[400],
                ),
              ),
              shrinkWrap: true,
              itemCount: DashBoardMockClass.getData.length,
              itemBuilder: (context, i) {
                return ListTile(
                    leading: Image.asset(DashBoardMockClass.getData[i].icon,
                        height: 40, width: 40),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${DashBoardMockClass.getData[i].name} (${DashBoardMockClass.getData[i].abbr})',
                              style: TextStyle(fontSize: 13)),
                          YMargin(4),
                          Row(children: [
                            Text(
                              '${DashBoardMockClass.getData[i].currency} (${DashBoardMockClass.getData[i].price})',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey[500]),
                            ),
                            Text(' ${DashBoardMockClass.getData[i].percentage}',
                                style: TextStyle(
                                    fontSize: 9, color: Color(0xff52CB35))),
                          ]),
                        ],
                      ),
                    ),
                    trailing: Image.asset(DashBoardMockClass.getData[i].graph,
                        height: 100, width: 100));
              },
            ),
            YMargin(6),
            Divider(
              color: Colors.grey[400],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Container(color: Colors.grey[100], height: 10),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 12.0, right: 12, left: 12, bottom: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Do more with HaggleX',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15))),
              YMargin(10),
              _doMoreCard('Send money instantly',
                  'Send crypto to another wallet', 'sendmoney.png'),
              _doMoreCard('Receive money from anyone',
                  'Receive crypto from another wallet', 'recievemoney.png'),
              _doMoreCard('Virtual Card',
                  'Make faster payments using HaggleX cards', 'sendmoney.png'),
              _doMoreCard('Global Remittance', 'Send money to anyone, anywhere',
                  'recievemoney.png'),
            ],
          ),
        ),
        YMargin(15),
        Container(color: Colors.grey[100], height: 10),

        //trendings:
        Column(
          //  mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("Trending crypto news",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ),
            ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: DashBoardMockClass.getData.length,
              itemBuilder: (context, i) {
                return ListTile(
                  // leading: Container(color: Colors.red, height: 50, width: 50),
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset('assets/images/bitcoin-news.jpeg')),
                  //     height: 100, width: 60),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 0.0, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        YMargin(10),
                        Text(
                            'Blockchain Bites: BTC on Ethereum, DeFi’s latest stablecoin, the currency cold wars',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500)),
                        YMargin(20),
                        Row(children: [
                          Text(
                            '6hrs ago',
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey[500]),
                          ),
                          XMargin(50),
                          Text('Category:',
                              style: TextStyle(
                                  fontSize: 9, color: Colors.grey[500])),
                          Text(' DeFi', style: TextStyle(fontSize: 10))
                        ]),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        YMargin(30),

        Container(height: 1, color: Colors.grey[200]),

        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('View all Stories',
                    style: TextStyle(color: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Icon(Icons.chevron_right),
              )
            ],
          ),
        ),
        Container(height: 1, color: Colors.grey[200]),

        YMargin(40)
      ],
    ));
  }

  Widget _doMoreCard(String title, String subtitle, String icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Card(
        color: Colors.white,
        elevation: 5,
        shadowColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/background-icon.png',
                        height: 40, width: 40),
                    Image.asset('assets/images/$icon', height: 30, width: 30),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                    YMargin(4),
                    Text(subtitle, style: TextStyle(fontSize: 9))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
