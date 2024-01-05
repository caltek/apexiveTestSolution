import 'package:apexive/blocs/timeform/cubit/timeform_cubit.dart';
import 'package:apexive/blocs/timesheet/time_sheets.dart';
import 'package:apexive/data/models/form.dart';
import 'package:apexive/data/models/project.dart';
import 'package:apexive/data/models/task.dart';
import 'package:apexive/ui/widgets/forms/checkbox.dart';
import 'package:apexive/ui/widgets/forms/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTaskForm extends StatelessWidget {
  const NewTaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 48),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            CustomDropDownMenu<Project>(
              label: "Project",
              value: context.watch<TimeformCubit>().form.projectId,
              items: context.read<TimesheetBloc>().state.projects,
              itemBuilder: (Project project) {
                return Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: project.color,
                      radius: 6,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      project.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                );
              },
              onSelected: (Project? project) {
                context
                    .read<TimeformCubit>()
                    .onProjectChanged(CustomFormField<Project>(value: project));
              },
              selectedItemBuilder: (Project? project) {
                return Text(project?.name ?? "Project");
              },
            ),
            CustomDropDownMenu<Task>(
              label: "Task",
              value: context.watch<TimeformCubit>().form.taskId,
              items: context.read<TimesheetBloc>().state.tasks,
              itemBuilder: (Task task) {
                return Row(
                  children: [
                    Text(
                      task.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                );
              },
              onSelected: (Task? task) {
                context
                    .read<TimeformCubit>()
                    .onTaskChanged(CustomFormField<Task>(value: task));
              },
              selectedItemBuilder: (Task? task) {
                return Text(task?.name ?? "Task");
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Description"),
              onChanged: (value) {
                context.read<TimeformCubit>().onDescriptionChanged(
                    CustomFormField<String>(value: value));
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CustomCheckBox(
              label: "Make Favorite",
              value: context.read<TimeformCubit>().form.favorite,
              onCheckedChanged: (value) {
                context
                    .read<TimeformCubit>()
                    .onFavoriteChanged(CustomFormField<bool>(value: value));
              },
            )
          ],
        ),
      ),
    );
  }
}
