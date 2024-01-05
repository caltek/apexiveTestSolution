import 'package:flutter/material.dart';

class ProminentBanner extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  const ProminentBanner({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: child,
      ),
    );
  }
}
