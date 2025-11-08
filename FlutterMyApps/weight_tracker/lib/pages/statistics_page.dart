import 'package:flutter/material.dart';
import '../models/weight_entry.dart';
import '../widgets/stat_card.dart';

class StatisticsPage extends StatelessWidget {
  final List<WeightEntry> entries;

  const StatisticsPage({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: entries.isEmpty
          ? const Center(
              child: Text(
                'No statistics available yet.\nAdd some weight entries first!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  StatCard(
                    title: 'Total Entries',
                    value: entries.length.toString(),
                    icon: Icons.calendar_month,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 12),
                  StatCard(
                    title: 'Highest Weight',
                    value: '${_calculateHighest().toStringAsFixed(1)} kg',
                    icon: Icons.arrow_upward,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 12),
                  StatCard(
                    title: 'Lowest Weight',
                    value: '${_calculateLowest().toStringAsFixed(1)} kg',
                    icon: Icons.arrow_downward,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 12),
                  StatCard(
                    title: 'Average Weight',
                    value: '${_calculateAverage().toStringAsFixed(1)} kg',
                    icon: Icons.analytics,
                    color: Colors.orange,
                  ),
                  const SizedBox(height: 12),
                  StatCard(
                    title: 'Total Change',
                    value: '${_calculateTotalChange().toStringAsFixed(1)} kg',
                    icon: _calculateTotalChange() >= 0
                        ? Icons.trending_up
                        : Icons.trending_down,
                    color: _calculateTotalChange() >= 0
                        ? Colors.red
                        : Colors.green,
                  ),
                ],
              ),
            ),
    );
  }

  double _calculateHighest() {
    if (entries.isEmpty) return 0;
    return entries.map((e) => e.weight).reduce((a, b) => a > b ? a : b);
  }

  double _calculateLowest() {
    if (entries.isEmpty) return 0;
    return entries.map((e) => e.weight).reduce((a, b) => a < b ? a : b);
  }

  double _calculateAverage() {
    if (entries.isEmpty) return 0;
    final total = entries.map((e) => e.weight).reduce((a, b) => a + b);
    return total / entries.length;
  }

  double _calculateTotalChange() {
    if (entries.length < 2) return 0;
    final sorted = List<WeightEntry>.from(entries)
      ..sort((a, b) => a.date.compareTo(b.date));
    return sorted.last.weight - sorted.first.weight;
  }
}
