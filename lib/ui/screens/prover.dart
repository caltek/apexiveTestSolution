import 'package:apexive/blocs/nav/nav_cubit.dart';
import 'package:apexive/ui/screens/navscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProviderWidet extends StatelessWidget {
  const ProviderWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NavScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<NavState>().state,
        onTap: (value) {
          context.read<NavState>().setIndex(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.time),
            label: 'Timesheets',
            activeIcon: Icon(
              CupertinoIcons.time_solid,
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.briefcase),
              label: 'Projects',
              activeIcon: Icon(CupertinoIcons.briefcase_fill)),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.gear),
            label: 'Settings',
            activeIcon: Icon(
              CupertinoIcons.gear_solid,
            ),
          ),
        ],
      ),
    );
  }
}
