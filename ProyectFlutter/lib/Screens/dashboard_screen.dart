import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:   SidebarX(
        extendedTheme: const SidebarXTheme(
          width: 200
        ),
        controller: SidebarXController(selectedIndex: 0,extended: true),
        items: const [
          SidebarXItem(icon: Icons.home, label: "Pràctica 1")
        ],
      ),
      appBar: AppBar(
        title: Text("Panel de control"),
      ),
    );
  }
}