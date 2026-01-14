import 'package:cash_back_infor/utils/button_primary.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  String? phoneNumber;
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(leading: Icon(Icons.arrow_back_ios_rounded)),
          body: Container(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 16),
            // decoration: BoxDecoration(
            //   color: Colors.amber
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/image/monkey.png', width: 151),
                ),
                SizedBox(height: 11),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nhập số điện thoại',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),

                SizedBox(height: 21),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 62,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          // SizedBox(width: 24),
                          SizedBox(
                            width: 80,
                            child: CountryCodePicker(
                              initialSelection: 'VN',
                              showFlag: true,
                              flagWidth: 28,
                              hideMainText: true,
                              showCountryOnly: true,
                              showOnlyCountryWhenClosed: true,
                              showDropDownButton: true,
                              alignLeft: false,
                              padding: EdgeInsets.zero,
                              margin: EdgeInsets.zero,
                            ),
                          ),
                          VerticalDivider(width: 1, indent: 16, endIndent: 16),
                          SizedBox(width: 4),
                        ],
                      ),

                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,

                            hint: Text(
                              'Số điện thoại',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: Colors.grey),
                            ),
                          ),
                          onChanged: (value) {
                            // this.phoneNo=value;
                            // print(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Column(
                  children: [
                    PrimaryButton(text: 'Tiếp tục', onPressed: () {

                    }, enabled: false,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
