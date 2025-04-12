import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/global_values.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:sidebarx/sidebarx.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:   SidebarX(
        headerBuilder: (context, extended) {
          return const UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage("https://drive.google.com/file/d/1I24RlaYArzp5OnWd1b3LT0yVPIvvcuBJ/view?usp=drive_link"),
          ),
          accountName: Text("Teirusu"), 
          accountEmail: Text("Gumshoe te Amo")
          );
        },
        extendedTheme: const SidebarXTheme(
          width: 200
        ),
        controller: SidebarXController(selectedIndex: 0,extended: true),
        items: [
          SidebarXItem(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/reto');
            },
            icon: Icons.home, label: 'Challenge App'
          )
        ],
      ),
      appBar: AppBar(
        title: Text('Panel de control'),
      ),
      body: HawkFabMenu(
        icon: AnimatedIcons.menu_arrow,
        body: const Center(
          child: Text('Your content here :)'),
        ), 
        items: [
          HawkFabMenuItem(
            label: 'Theme Light', 
            ontap: () => GlobalValues.themeMode.value = 1, 
            icon: const Icon(Icons.light_mode)
          ),
          HawkFabMenuItem(
            label: 'Theme Light', 
            ontap: () => GlobalValues.themeMode.value = 0, 
            icon: const Icon(Icons.dark_mode)
          ),
           HawkFabMenuItem(
            label: 'Theme Warm', 
            ontap: () => GlobalValues.themeMode.value = 0, 
            icon: const Icon(Icons.dark_mode)
           )
        ]
      )
    );
  }
}