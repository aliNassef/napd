import 'package:flutter/material.dart';
import 'package:napd/core/utils/app_strings.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class SelectTimeButton extends StatefulWidget {
  const SelectTimeButton(
      {super.key, required this.onTimeSelected,required this.initalTime});
  final ValueChanged<TimeOfDay> onTimeSelected;
  final TimeOfDay initalTime;
  @override
  State<SelectTimeButton> createState() => _SelectTimeButtonState();
}

class _SelectTimeButtonState extends State<SelectTimeButton> {
  TimeOfDay? _selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: widget.initalTime,
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
      widget.onTimeSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectTime(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedTime == null
                  ? AppStrings.selectTime
                  : AppStrings.selectedTime + _selectedTime!.format(context),
              style: AppStyles.roboto16Regular.copyWith(
                color: _selectedTime == null
                    ? Colors.grey
                    : AppColors.primaryColor,
              ),
            ),
            Icon(
              Icons.access_time,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
