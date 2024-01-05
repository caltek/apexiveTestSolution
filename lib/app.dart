import 'package:apexive/blocs/nav/nav_cubit.dart';
import 'package:apexive/blocs/theme/cubit/theme_cubit.dart';
import 'package:apexive/blocs/timesheet/time_sheets.dart';
import 'package:apexive/blocs/timesheet/time_sheets_state.dart';
import 'package:apexive/ui/screens/prover.dart';
import 'package:apexive/ui/widgets/gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => TimesheetBloc()..add(TimersheetEventLoad())),
        BlocProvider(create: (context) => NavState()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: const _MaterialApp(),
    );
  }
}

class _MaterialApp extends StatelessWidget {
  const _MaterialApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apexive Solution',
      theme: context.watch<ThemeCubit>().state.themeData,
      home: const Background(child: ProviderWidet()),
    );
  }
}
