import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:give_n_go/ui/charity_page/charity_detail.dart';
import 'package:give_n_go/ui/home_page/home_page_state.dart';
import 'package:provider/provider.dart';
import '../common/nav_bar.dart';

import '../common/bottom-nav-bar-widget.dart';

class MayBankHP extends StatelessWidget {
  MayBankHP({super.key});

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Maybank Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    CharityDetail(), // TODO: Change to CharityHome
    Text('Settings Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  @override
  Widget build(BuildContext context) {
    //final homePageProvider = Provider.of<HomePageProvider>(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Maybank Home Page'),
          backgroundColor: Colors.green),
      body: Center(
        child: Text("Hello"),
        //_widgetOptions.elementAt(homePageProvider.selectedIndex),
      ),
      bottomNavigationBar: ChangeNotifierProvider(
        create: (context) => BottomNavBarProvider(),
        child: const BottomNavBar(),
      ),
    );
  }
}
