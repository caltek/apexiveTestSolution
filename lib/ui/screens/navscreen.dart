import 'package:apexive/blocs/nav/nav_cubit.dart';
import 'package:apexive/ui/screens/projects/projects.dart';
import 'package:apexive/ui/screens/settings.dart';
import 'package:apexive/ui/screens/timesheet.dart/timesheets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  late PageController controller;
  @override
  void initState() {
    controller = PageController(
      keepPage: true,
      initialPage: context.read<NavState>().state,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavState, int>(
      listener: (context, state) {
        controller.animateToPage(state,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      },
      child: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [TimeSheet(), Projects(), SettingsScreen()],
      ),
    );
  }
}
