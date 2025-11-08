import 'package:flutter/material.dart';
import 'models/weight_entry.dart';
import 'pages/weight_list_page.dart';
import 'pages/statistics_page.dart';
import 'widgets/entry_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weight Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WeightTrackerHome(),
    );
  }
}

class WeightTrackerHome extends StatefulWidget {
  const WeightTrackerHome({super.key});

  @override
  State<WeightTrackerHome> createState() => _WeightTrackerHomeState();
}

class _WeightTrackerHomeState extends State<WeightTrackerHome> {
  final List<WeightEntry> _entries = [];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0
          ? WeightListPage(
              entries: _entries,
              onAddEntry: _addNewEntry,
              onEditEntry: _editEntry,
            )
          : StatisticsPage(entries: _entries),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Weight Log'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }

  void _addNewEntry() {
    showDialog(
      context: context,
      builder: (context) => EntryDialog(
        onSave: (entry) {
          setState(() {
            _entries.add(entry);
            _sortEntries();
          });
        },
      ),
    );
  }

  void _editEntry(int index) {
    showDialog(
      context: context,
      builder: (context) => EntryDialog(
        entry: _entries[index],
        index: index,
        onSave: (entry) {
          setState(() {
            _entries[index] = entry;
            _sortEntries();
          });
        },
        onDelete: () {
          setState(() {
            _entries.removeAt(index);
            _sortEntries();
          });
        },
      ),
    );
  }

  void _sortEntries() {
    _entries.sort((a, b) => b.date.compareTo(a.date));
  }
}
