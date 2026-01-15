import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

abstract class SingupInputSection extends StatelessWidget {
  const SingupInputSection({super.key});
}

class PhoneInputSection extends StatelessWidget {
  final bool isValid;
  final ValueChanged<String> onChanged;

  const PhoneInputSection({
    super.key,
    required this.isValid,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nhập số điện thoại',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 21),
        Container(
          height: 62,
          decoration: BoxDecoration(
            border: Border.all(
              color: isValid ? Color(0xFF92C73D) : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 80,
                child: CountryCodePicker(
                  initialSelection: 'VN',
                  showFlag: true,
                  flagWidth: 28,
                  hideMainText: true,
                  showDropDownButton: true,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                ),
              ),
              const VerticalDivider(width: 1, indent: 16, endIndent: 16),
              const SizedBox(width: 4),

              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Số điện thoại',
                    errorStyle: TextStyle(height: 0),
                    hintStyle: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    suffixIcon: isValid
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : null,
                  ),
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
