import 'package:flutter/material.dart';

import 'journal_entry_content.dart';
import 'package:flutter/widgets.dart';

import 'new_entries.dart';
import '../db/db_manager.dart';

import '../models/journal.dart';
import '../models/journal_entry.dart';
import '../widgets/journal_scaffold.dart';
import '../widgets/welcome.dart';
import '../widgets/entry_display.dart';

class JournalEntryListScreen extends StatefulWidget {
  static const routeKey = '/';
  final changeTheme;
  final state;
  const JournalEntryListScreen({Key? key, this.changeTheme, this.state})
      : super(key: key);

  @override
  _JournalEntryListScreenState createState() => _JournalEntryListScreenState();
}

class _JournalEntryListScreenState extends State<JournalEntryListScreen> {
  late Journal journal;
  late journalEntry record;

  @override
  void initState() {
    super.initState();
    journal = Journal(entries: []);
    loadJournal();
  }

  void loadJournal() async {
    final dbManager = DatabaseManager.getInstance();
    List<journalEntry> journalRecords = await dbManager.getEntries();
    print(journalRecords);

    setState(() {
      journal = Journal(entries: journalRecords);
    });
  }

  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (journal == null || journal.isEmpty) {
      return JournalScaffold(
          key: UniqueKey(),
          title: 'Welcome',
          bodyContent: Welcome(),
          floatingActionButton: addButton(context),
          changeTheme: widget.changeTheme,
          state: widget.state);
    } else {
      return JournalScaffold(
          key: UniqueKey(),
          title: 'Journal Entires',
          bodyContent: sizeHelper(context),
          floatingActionButton: addButton(context),
          changeTheme: widget.changeTheme,
          state: widget.state);
    }
  } //Buid

  Widget addButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        push_new_entries(context);
      },
    );
  }

  Widget displayJournal(BuildContext context, display) {
    return ListView.builder(
      itemCount: journal.entries.length,
      itemBuilder: (context, index) {
        return display(context, index);
      },
    );
  }

  Widget entryRow(BuildContext context, index) {
    return GestureDetector(
      child: portraitDisplay(context, index),
      onTap: () {
        push_entry_content(context, journal.entries[index]);
      },
    );
  }

  Widget portraitDisplay(BuildContext context, index) {
    return Card(
      child: ListTile(
        title: Text("${journal.entries[index].title}"),
        subtitle: Text('${journal.entries[index].date}'),
      ),
    );
  }

  Widget horizontalDisplay(BuildContext context, index) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Text("${journal.entries[index].title}"),
            Text('${journal.entries[index].date}'),
          ]),
          EntryDisplay(entry: journal.entries[index]),
        ],
      ),
    );
  }

  Widget sizeHelper(BuildContext context) {
    return MediaQuery.of(context).size.width < 700
        ? displayJournal(context, entryRow)
        : displayJournal(context, horizontalDisplay);
  }

  // ignore: non_constant_identifier_names
  void push_new_entries(BuildContext context) {
    Navigator.of(context).pushNamed(NewEntriesScreen.routeKey);
  }

  // ignore: non_constant_identifier_names
  void push_entry_content(BuildContext context, journalEntry current_entry) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EntryScreen(
                entry: current_entry,
                key: UniqueKey(),
                changeTheme: widget.changeTheme,
                state: widget.state)));
  }
}
