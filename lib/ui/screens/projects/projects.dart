import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects>
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
            title: const Text('Projects'),
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
                onPressed: () {},
                icon: const Icon(CupertinoIcons.add),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
