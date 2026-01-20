import 'package:cash_back_infor/features/theme/color_theme.dart';
import 'package:cash_back_infor/features/ui/utils/button_primary.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

String? selectedValue;
IconData getBankIcon(String bank) {
  switch (bank) {
    case 'Techcombank':
      return Icons.account_balance_wallet;
    case 'Vietcombank':
      return Icons.account_balance;
    case 'MB Bank':
      return Icons.security;
    case 'Agribank':
      return Icons.agriculture;
    default:
      return Icons.account_balance;
  }
}

class CashBackWidget extends StatefulWidget {
  const CashBackWidget({super.key});

  @override
  State<CashBackWidget> createState() => _CashBackWidget();
}

class _CashBackWidget extends State<CashBackWidget> {
  String name = '';
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thông tin nhận hoàn tiền',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            fontFamily: 'Nunito',
          ),
        ),
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.angleLeft),
          onPressed: () {
            context.go('/');
          },
        ),
        elevation: 1,
        shadowColor: Colors.grey.withValues(alpha: 0.5),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chúc mừng bé đã hoàn thành\nThử thách 60 ngày!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Ba mẹ vui lòng điền đầy đủ thông tin bên dướiđể Monkey hoàn tất thủ tục hoàn tiền',
                  style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  padding: EdgeInsets.all(10),
                  child: Image.asset('assets/image/cashback_illustration.png'),
                ),
                Text(
                  "Thông tin người nhận",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Họ tên ba/mẹ",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.signinDisplayDefault,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 44,
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: TextFormField(
                      controller: textController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nhập họ tên',
                        hintStyle: TextStyle(
                          color: AppColor.signinDisplayDefault,
                          fontSize: 16,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Số điện thoại đăng ký mua hàng",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.signinDisplayDefault,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 44,
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nhập số điện thoại',
                        hintStyle: TextStyle(
                          color: AppColor.signinDisplayDefault,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Text(
                  "Tài khoản nhận hoàn tiền",
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.signinDisplayDefault,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 44,
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: DropdownSearch<String>(
                      items: (f, cs) => [
                        "Techcombank",
                        'Vietcombank',
                        'MB Bank',
                        'Agribank',
                      ],
                      decoratorProps: DropDownDecoratorProps(
                        decoration: InputDecoration(
                          labelStyle: TextStyle(height: 44),
                          border: InputBorder.none,
                          hintText: 'Chọn ngân hàng',
                          hintStyle: TextStyle(
                            color: AppColor.signinDisplayDefault,
                            fontSize: 16,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColor.signinDisplayDefault,
                          ),
                        ),
                      ),
                      popupProps: PopupProps.menu(
                        fit: FlexFit.loose,
                        showSearchBox: true,
                        itemBuilder: (context, item, isSelected, isDisabled) {
                          return ListTile(
                            leading: Icon(getBankIcon(item)),
                            title: Text(item),
                          );
                        },
                        searchFieldProps: TextFieldProps(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            hintText: 'Tìm ngân hàng',
                            hintStyle: TextStyle(
                              color: AppColor.signinDisplayDefault,
                              fontSize: 16,
                            ),
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Chi nhánh',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.signinDisplayDefault,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 44,
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nhập chi nhánh',
                        hintStyle: TextStyle(
                          color: AppColor.signinDisplayDefault,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Số tài khoản",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.signinDisplayDefault,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 44,
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nhập số tài khoản',
                        hintStyle: TextStyle(
                          color: AppColor.signinDisplayDefault,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Chủ tài khoản",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.signinDisplayDefault,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 44,
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: textController.text,
                        labelStyle: TextStyle(
                          color: AppColor.signinDisplayDefault,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        hintText: 'Nhập tên chủ tài khoản',
                        hintStyle: TextStyle(
                          color: AppColor.signinDisplayDefault,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: true,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Tôi đồng ý thông tin tôi cung cấp bên trên chính xác',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16),
                PrimaryButton(text: 'Xác nhận', onPressed: () {}),
                SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Nunito',
                      color: Colors.grey,
                    ),
                    children: const [
                      TextSpan(
                        text:
                            '*Monkey sẽ hoàn tiền trong vòng 30 ngày kể từ ngày bé ',
                      ),
                      TextSpan(
                        text: 'hoàn thành thử thách',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '.'),
                    ],
                  ),
                ),
                SizedBox(height: 32),
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
