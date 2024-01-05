import 'package:apexive/blocs/timesheet/time_sheets.dart';
import 'package:apexive/ui/screens/new_task/new_task.dart';
import 'package:apexive/ui/screens/timesheet.dart/favourites.dart';
import 'package:apexive/ui/screens/timesheet.dart/local.dart';
import 'package:apexive/ui/screens/timesheet.dart/odoo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeSheet extends StatefulWidget {
  const TimeSheet({super.key});

  @override
  State<TimeSheet> createState() => _TimeSheetState();
}

class _TimeSheetState extends State<TimeSheet>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(128),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AppBar(
            titleSpacing: 0,
            title: const Text('Timesheets'),
            bottom: TabBar(
              controller: tabController,
              tabs: const [
                Tab(
                  child: Text("Favorites"),
                ),
                Tab(
                  child: Text("Odoo"),
                ),
                Tab(
                  child: Text("Local"),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    NewTimer.route(
                      timesheetBloc: context.read<TimesheetBloc>(),
                    ),
                  );
                },
                icon: const Icon(CupertinoIcons.add),
              )
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [FavouritesSheet(), OdooTimerSheet(), LocalTimeSheet()],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
