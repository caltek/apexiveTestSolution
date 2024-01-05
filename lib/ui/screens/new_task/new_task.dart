import 'package:apexive/blocs/timeform/cubit/timeform_cubit.dart';
import 'package:apexive/blocs/timesheet/time_sheets.dart';
import 'package:apexive/blocs/timesheet/time_sheets_state.dart';
import 'package:apexive/ui/screens/new_task/form.dart';
import 'package:apexive/ui/widgets/gradient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTimer extends StatelessWidget {
  const NewTimer({super.key});
  static Route route({required TimesheetBloc timesheetBloc}) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider.value(
        value: timesheetBloc,
        child: const NewTimer(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: BlocProvider(
        create: (context) => TimeformCubit(),
        child: BlocListener<TimeformCubit, TimeformState>(
          listenWhen: (previous, current) => current is TimerFormSaved,
          listener: (context, state) {
            if (state is! TimerFormSaved) return;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Timer Created Successfully"),
              ),
            );
            context.read<TimesheetBloc>().add(TimerheetEventAdd(state.timer));
            Navigator.of(context).pop();
          },
          child: Scaffold(
            appBar: AppBar(
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
                "Create Timer",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w600, letterSpacing: 0.15),
              ),
            ),
            body: const NewTaskForm(),
            bottomNavigationBar: const SaveButton(),
          ),
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FilledButton(
          onPressed: () {
            context.read<TimeformCubit>().onSave();
          },
          style: Theme.of(context).filledButtonTheme.style?.copyWith(
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 14, horizontal: 20)),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),
          child: Text(
            "Create Timer",
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
