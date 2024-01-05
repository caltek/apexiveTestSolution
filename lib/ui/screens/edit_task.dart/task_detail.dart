import 'package:apexive/blocs/timesheet/time_sheets.dart';
import 'package:apexive/data/models/project.dart';
import 'package:apexive/data/models/task.dart';
import 'package:apexive/ui/widgets/banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TaskDetail extends StatefulWidget {
  final Task task;
  const TaskDetail({super.key, required this.task});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail>
    with AutomaticKeepAliveClientMixin {
  late Project project;
  @override
  void initState() {
    project = context.read<TimesheetBloc>().getTaskProject(widget.task);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildDetail(), _buildDescription()],
      ),
    );
  }

  Widget _buildDetail() {
    return ProminentBanner(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildProject(), _buildDeadline(), _buildAssignTo()],
      ),
    );
  }

  Widget _buildDescription() {
    return ProminentBanner(
      child: _buildTile(
        "Description",
        Text(
          widget.task.description,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }

  Widget _buildDeadline() {
    return _buildTile(
        "Deadline",
        Text(
          DateFormat("dd/MM/yyyy").format(widget.task.deadline),
          style: Theme.of(context).textTheme.titleMedium,
        ));
  }

  Widget _buildAssignTo() {
    return _buildTile(
      "Assigned To",
      Text(
        widget.task.assignedTo,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _buildProject() {
    return _buildTile(
      "Project",
      Row(
        children: [
          Container(
            height: 24,
            width: 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: project.color),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            project.name,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Widget _buildTile(String title, Widget child) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(
          height: 4,
        ),
        child,
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
