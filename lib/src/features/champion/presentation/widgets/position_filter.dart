import 'package:flutter/material.dart';

class PositionFilter extends StatelessWidget {
  final List<String> options;
  final List<String> selected;
  final ValueChanged<String> onSelect;

  const PositionFilter({
    super.key,
    required this.options,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children:
          options.map((pos) {
            final isSelected = selected.contains(pos);
            return ChoiceChip(
              label: Text(
                pos,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              selectedColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey[300],
              selected: isSelected,
              onSelected: (_) => onSelect(pos),
            );
          }).toList(),
    );
  }
}
