import 'package:flutter/material.dart';
import 'package:milkman_task/util/constants.dart';

class SortChip extends StatelessWidget {
  final int sortId;
  final String label;
  final bool isSelected;
  final void Function(int sortId, bool isSelected)? onClick;

  const SortChip({Key? key, required this.sortId, required this.label, this.isSelected = false, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accent.withOpacity(0.2) : Colors.transparent,
          border: Border.all(color: isSelected ? AppColors.accent.withOpacity(0.8) : Colors.black26),
          borderRadius: BorderRadius.circular(4),
        ),
        child: RawMaterialButton(
          onPressed: () => onClick?.call(sortId, !isSelected),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(label),
                if (isSelected) ...{
                  const SizedBox(width: 4),
                  const Icon(Icons.close),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}
