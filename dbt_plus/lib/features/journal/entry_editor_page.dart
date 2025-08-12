import 'package:flutter/material.dart';
import '../../widgets/app_scaffold.dart';
import '../common/tension_slider.dart';

class EntryEditorPage extends StatelessWidget {
  const EntryEditorPage({super.key, this.id});
  final String? id;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: id == null ? 'New Entry' : 'Edit Entry',
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text('Mood'),
          TensionSlider(),
          SizedBox(height: 16),
          TextField(maxLines: 5, decoration: InputDecoration(labelText: 'Notes')),
        ],
      ),
    );
  }
}
