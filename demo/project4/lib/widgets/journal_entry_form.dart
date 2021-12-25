import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'journal_scaffold.dart';
import 'dropdown_rating_form_field.dart';
import '../db/db_manager.dart';
import '../models/journal_entry.dart';
import '../screens/journal_entries_list.dart';

class JournalEntryForm extends StatefulWidget {
  late final changeTheme;
  late final state;
  JournalEntryForm({Key? key, this.changeTheme, this.state}) : super(key: key);
  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  final formKey = GlobalKey<FormState>();
  final journalEntryFields =
      journalEntry(title: '', body: '', date: '', rating: -1);
  late final changeTheme;
  late final state;

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
        title: 'Add Bew Entries!',
        floatingActionButton: Container(),
        changeTheme: widget.changeTheme,
        state: widget.state,
        bodyContent: bodyContent(context));
  } //Build func

  Widget bodyContent(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
            key: formKey,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.,
              children: [
                //Title field
                titleRow(context),
                SizedBox(height: 10),

                //Body Field
                bodyRow(context),
                SizedBox(height: 10),

                //Rating Field
                ratingRow(context),
                SizedBox(height: 10),

                //Cancel and Save buttons
                buttonsRow(context)
              ],
            )));
  }

  Widget titleRow(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints.tight(Size(MediaQuery.of(context).size.width, 50)),
      child: TextFormField(
          autofocus: true,
          decoration:
              InputDecoration(labelText: 'Title', border: OutlineInputBorder()),
          onSaved: (value) {
            //Store title value in JournalEntryField
            journalEntryFields.title = value!;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'The input box can not be empty';
            } else {
              return null;
            }
          }),
    );
  }

  Widget bodyRow(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints.tight(Size(MediaQuery.of(context).size.width, 50)),
      child: TextFormField(
          autofocus: true,
          decoration:
              InputDecoration(labelText: 'Body', border: OutlineInputBorder()),
          onSaved: (value) {
            //Store title value in JournalEntryField
            journalEntryFields.body = value!;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'The input box can not be empty';
            } else {
              return null;
            }
          }),
    );
  }

  Widget ratingRow(BuildContext context) {
    return DropdownRatingFormField(
      maxRating: 4,
      onSaved: (value) {
        journalEntryFields.rating = value;
      },
      validator: (value) {
        if (value == null) {
          return "Enter a rating";
        } else {
          return null;
        }
      },
    );
  }

  Widget buttonsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [cancelButton(context), saveButton(context)],
    );
  }

  Widget cancelButton(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();

            //Datebase.of(context).saveJournalEntry(journalEntryFields)
            //Go back to the previous screen
            Navigator.of(context).pop();
          }
        },
        child: Text('Cancel'));
  }

  Widget saveButton(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            formatDate();

            final dbManager = DatabaseManager.getInstance();
            dbManager.save(entry: journalEntryFields);
            //Go back to the previous screen
            Navigator.of(context).pushNamed(JournalEntryListScreen.routeKey);
          }
        },
        child: Text('Save'));
  }

  void formatDate() {
    //Format the date
    journalEntryFields.date =
        DateFormat('EEEE, MMMM d, y').format(DateTime.now());
  }
} //class
