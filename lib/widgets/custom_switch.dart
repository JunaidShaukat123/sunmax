import 'package:flutter/material.dart';

import '/core/app_export.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final double width;
  final double height;
  final String label;
  final Color activeColor;
  final Color toggleColor;
  final Color inactiveColor;
  final Color activeToggleColor;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    super.key,
    this.width = 60,
    this.label = '',
    this.height = 20,
    required this.value,
    required this.onChanged,
    this.toggleColor = Colors.grey,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
    this.activeToggleColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              width: width,
              height: height,
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(height / 2),
                color: value ? activeColor : inactiveColor,
              ),
            ),
            AnimatedPositioned(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 300),
              left: value ? width - height : 0,
              right: value ? 0 : width - height,
              child: Container(
                width: height,
                height: height - (height * 0.1),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: appTheme.whiteA700),
                  color: value ? activeToggleColor : toggleColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                      color: Colors.black.withValues(alpha: 0.1),
                    ),
                  ],
                ),
                child: Text(label, style: CustomTextStyles.titleMedium18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
