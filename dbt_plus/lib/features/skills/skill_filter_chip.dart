import 'package:flutter/material.dart';

class SkillFilterChip extends StatelessWidget {
  const SkillFilterChip({super.key, required this.label, this.onSelected});
  final String label;
  final ValueChanged<bool>? onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(label: Text(label), onSelected: onSelected ?? (_) {});
  }
}
