import 'journal_entry.dart';

class Journal {
  List<journalEntry> entries = [];

  Journal({required this.entries});

  bool get isEmpty => entries.isEmpty;

  

  void addEntry(entry) {
    // ignore: unnecessary_null_comparison
    //entries == null ? entries = [entry] : entries.add(entry);
    entries.add(entry);
  }
}
