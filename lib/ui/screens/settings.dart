import 'package:apexive/blocs/theme/cubit/theme_cubit.dart';
import 'package:apexive/ui/widgets/banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  final List<Set<String>> odooAccounts = const [
    {"https://portal.apexive.com/", "Nikita3@apexive.com"},
    {"https://portal.apexive.com/", "Nikita2@apexive.com"},
  ];
  final List<Set<String>> githubAccounts = const [
    {"Nikita3@apexive.com"},
  ];
  @override
  Widget build(BuildContext context) {
    final themeMode = context.read<ThemeCubit>().state.themeMode;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSettingsTile(
              context,
              "Theme",
              children: [
                ProminentBanner(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTitle(context,
                          "${themeMode == ThemeMode.light ? "Light" : "Dark"} Theme"),
                      Transform.scale(
                        scale: 1.2,
                        child: Switch(
                          value: true,
                          activeTrackColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          inactiveTrackColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          thumbColor: MaterialStateProperty.all(Colors.white),
                          thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
                              (states) {
                            return themeMode == ThemeMode.light
                                ? const Icon(
                                    CupertinoIcons.sun_max,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    CupertinoIcons.moon_fill,
                                    color: Colors.black,
                                  );
                          }),
                          onChanged: (_) {
                            context.read<ThemeCubit>().toggleThemeState();
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            _buildSettingsTile(context, "Synchronizations", children: [
              buildAccount(context, odooAccounts, "Odoo"),
              SizedBox.fromSize(
                size: const Size.fromHeight(24),
              ),
              buildAccount(context, githubAccounts, "GitHub"),
            ]),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: ProminentBanner(
                child: _buildTitle(context, "Privacy Policy"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: ProminentBanner(
                child: _buildTitle(context, "Terms of Service"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAccount(
      BuildContext context, List<Set<String>> accounts, String accountType) {
    return _buildSettingsTile(context, accountType, dense: true, children: [
      ...accounts.map((account) {
        return ProminentBanner(
          onTap: () {
            onAccountTap(context);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context, account.first),
              if (account.length > 1) _buildSubtitle(context, account.last)
            ],
          ),
        );
      }),
      SizedBox.fromSize(
        size: const Size.fromHeight(48),
        child: FilledButton(
          onPressed: () {},
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
            "Sync new $accountType account",
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      )
    ]);
  }

  Widget _buildTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  Widget _buildSubtitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }

  Widget buildThemeTile(BuildContext context) {
    return _buildSettingsTile(context, "Theme", children: []);
  }

  Widget _buildHeader(BuildContext context, String header) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        header,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  Widget _buildSettingsTile(BuildContext context, String title,
      {List<Widget> children = const [], bool dense = false}) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      runSpacing: 8,
      children: [
        Padding(
          padding: EdgeInsets.all(dense ? 0 : 16.0).copyWith(bottom: 0),
          child: Wrap(
            runSpacing: 8,
            children: [
              _buildHeader(context, title),
              ...children,
            ],
          ),
        ),
        if (!dense) const Divider()
      ],
    );
  }

  onAccountTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
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
                title: const Text("Unlink Account"),
                titleTextStyle: Theme.of(context).textTheme.labelLarge,
              ),
              const Divider(),
              ListTile(
                textColor: Colors.white,
                iconColor: Colors.white,
                leading: const Icon(CupertinoIcons.arrow_2_circlepath),
                title: const Text("Re-sync the account"),
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
