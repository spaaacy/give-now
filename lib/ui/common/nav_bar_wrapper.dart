import 'package:flutter/material.dart';
import 'package:give_n_go/ui/common/nav_bar_state.dart';
import 'package:provider/provider.dart';

import '../../service/notification_service.dart';
import '../../util/location_helper.dart';
import 'nav_bar.dart';

class NavBarWrapper extends StatelessWidget {
  const NavBarWrapper({super.key});
  @override
  Widget build(BuildContext context) {
    NotificationService().initialize(context);
    final state = context.watch<NavBarState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(state.widgetTitles.elementAt(state.selectedIndex))
      ),
      body: Center(child: state.widgetOptions.elementAt(state.selectedIndex),),
      bottomNavigationBar: const NavBar(),
    );
  }
}
