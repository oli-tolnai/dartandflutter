import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/weight_entry.dart';

class WeightListPage extends StatelessWidget {
  final List<WeightEntry> entries;
  final VoidCallback onAddEntry;
  final Function(int) onEditEntry;

  const WeightListPage({
    super.key,
    required this.entries,
    required this.onAddEntry,
    required this.onEditEntry,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Log'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: entries.isEmpty
          ? const Center(
              child: Text(
                'No weight entries yet.\nTap + to add your first entry!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: Text(
                      DateFormat('MMMM dd, yyyy').format(entry.date),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Weight: ${entry.weight.toStringAsFixed(1)} kg',
                    ),
                    trailing: const Icon(Icons.edit),
                    onTap: () => onEditEntry(index),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddEntry,
        child: const Icon(Icons.add),
      ),
    );
  }
}
