import 'package:flutter/material.dart';
import '../../widgets/app_scaffold.dart';

class SkillDetailPage extends StatelessWidget {
  const SkillDetailPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Skill',
      body: Center(child: Text('Detail for $id')),
    );
  }
}
