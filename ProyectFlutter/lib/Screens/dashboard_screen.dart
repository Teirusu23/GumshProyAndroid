import 'package:flutter/material.dart';
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
        items: const [
          SidebarXItem(
            Navigator.pop(context),
            onTap: () => Navigator.pushNamed(context,"/reto");
            icon: Icons.home, label: "Challenge App"
          )
        ],
      ),
      appBar: AppBar(
        title: Text("Panel de control"),
      ),
      body: Hawfk,
    );
  }
}