import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final String category;
  final bool isSelected;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? Colors.green : Colors.transparent,
          ),
          child: Text(
            category,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: isSelected ? 16 : 14,
            ),
          ),
        ),
      ),
    );
  }
}
