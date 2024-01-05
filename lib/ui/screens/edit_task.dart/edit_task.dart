import 'package:apexive/data/models/task.dart';
import 'package:apexive/ui/screens/edit_task.dart/task_detail.dart';
import 'package:apexive/ui/screens/edit_task.dart/task_timers.dart';
import 'package:apexive/ui/widgets/gradient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditTask extends StatefulWidget {
  final Task task;
  const EditTask({super.key, required this.task});

  static Route route({required Task task}) {
    return MaterialPageRoute(
      builder: (context) => EditTask(task: task),
    );
  }

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(128),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: AppBar(
              automaticallyImplyLeading: true,
              leading: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  CupertinoIcons.chevron_left,
                  size: 24,
                ),
              ),
              centerTitle: true,
              title: Text(
                widget.task.name,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w600, letterSpacing: 0.15),
              ),
              actions: const [EditButton()],
              bottom: TabBar(
                controller: tabController,
                tabs: const [
                  Tab(
                    child: Text("Timesheets"),
                  ),
                  Tab(
                    child: Text("Details"),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(controller: tabController, children: [
          TaskTimers(task: widget.task),
          TaskDetail(task: widget.task)
        ]),
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onEditTask(context);
      },
      child: const SizedBox(
        width: 48,
        height: 48,
        child: Icon(
          CupertinoIcons.pencil,
          size: 24,
        ),
      ),
    );
  }

  onEditTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                textColor: Colors.white,
                iconColor: Colors.white,
                leading: const Icon(CupertinoIcons.trash),
                title: const Text("Delete"),
                onTap: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Center(child: Text("Task Deleted")),
                  ));
                },
                titleTextStyle: Theme.of(context).textTheme.labelLarge,
              ),
              const Divider(),
              ListTile(
                textColor: Colors.white,
                iconColor: Colors.white,
                leading: const Icon(CupertinoIcons.star),
                title: const Text("Favorite"),
                onTap: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Center(child: Text("Not implemented")),
                  ));
                },
                titleTextStyle: Theme.of(context).textTheme.labelLarge,
              ),
              const Divider()
            ],
          ),
        );
      },
    );
  }
}
