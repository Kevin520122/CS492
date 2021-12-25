import 'package:flutter/material.dart';
import '../widgets/journal_entry_form.dart';

class NewEntriesScreen extends StatefulWidget {
  static const routeKey = 'new_entries';
  late final changeTheme;
  late final state;

  NewEntriesScreen({Key? key, this.changeTheme, this.state}) : super(key: key);

  @override
  _NewEntriesScreenState createState() => _NewEntriesScreenState();
}

class _NewEntriesScreenState extends State<NewEntriesScreen> {
  @override
  Widget build(BuildContext context) {
    return JournalEntryForm(changeTheme: widget.changeTheme, state: widget.state);
  }
}
