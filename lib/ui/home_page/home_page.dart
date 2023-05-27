import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:give_n_go/ui/common/nav_bar_state.dart';
import 'package:provider/provider.dart';
import '../common/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
