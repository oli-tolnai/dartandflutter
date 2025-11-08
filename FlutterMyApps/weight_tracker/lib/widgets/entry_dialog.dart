import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/weight_entry.dart';

class EntryDialog extends StatefulWidget {
  final WeightEntry? entry;
  final int? index;
  final Function(WeightEntry) onSave;
  final Function()? onDelete;

  const EntryDialog({
    super.key,
    this.entry,
    this.index,
    required this.onSave,
    this.onDelete,
  });

  @override
  State<EntryDialog> createState() => _EntryDialogState();
}

class _EntryDialogState extends State<EntryDialog> {
  late DateTime selectedDate;
  late TextEditingController weightController;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.entry?.date ?? DateTime.now();
    weightController = TextEditingController(
      text: widget.entry?.weight.toString() ?? '',
    );
  }

  @override
  void dispose() {
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.entry != null;

    return AlertDialog(
      title: Text(isEditing ? 'Edit Weight Entry' : 'Add Weight Entry'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: weightController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Weight (kg)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            title: const Text('Date'),
            subtitle: Text(DateFormat('MMMM dd, yyyy').format(selectedDate)),
            trailing: const Icon(Icons.calendar_today),
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                setState(() {
                  selectedDate = picked;
                });
              }
            },
          ),
        ],
      ),
      actions: [
        if (isEditing && widget.onDelete != null)
          TextButton(
            onPressed: () {
              widget.onDelete!();
              Navigator.pop(context);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final weight = double.tryParse(weightController.text);
            if (weight != null && weight > 0) {
              widget.onSave(WeightEntry(date: selectedDate, weight: weight));
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please enter a valid weight')),
              );
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
