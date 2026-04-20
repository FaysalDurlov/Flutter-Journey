import 'package:flutter/material.dart';

class AdditionalInfoItem extends StatelessWidget {
  final IconData icons;
  final String label;
  final String value;

  // const AdditionalInfoItem(this.icons, this.label, this.value, {super.key,});
  // this is a positional parameter constructor (just here for reference that we can also do with this way)


  const AdditionalInfoItem({required this.icons, required this.label, required this.value, super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
            child: Column(
              children: [
                Icon(icons, size: 34),
                SizedBox(height: 8),
                Text(label),
                SizedBox(height: 4),
                Text(value,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
  }
}