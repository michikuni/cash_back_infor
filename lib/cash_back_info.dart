import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

String? selectedValue;

class CashBackWidget extends StatelessWidget {
  const CashBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 20.0),
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
            SizedBox(height: 5),
            Text(
              'Ba mẹ vui lòng điền đầy đủ thông tin bên dướiđể Monkey hoàn tất thủ tục hoàn tiền',
              style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.all(10),
              child: Image.asset('assets/image/cashback_illustration.webp'),
            ),
            Text(
              "Thông tin người nhận",
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Họ tên ba/mẹ",
              style: TextStyle(fontSize: 14, fontFamily: 'Nunito'),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(height: 44),
                border: OutlineInputBorder(),
                labelText: 'Nhập họ tên',
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Số điện thoại đăng ký mua hàng",
              style: TextStyle(fontSize: 14, fontFamily: 'Nunito'),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(height: 44),
                border: OutlineInputBorder(),
                labelText: 'Nhập số điện thoại',
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
            SizedBox(height: 10),
            DropdownSearch<String>(
              items: (f, cs) => [
                "Techcombank",
                'Vietcombank',
                'MB Bank',
                'Agribank',
              ],
              decoratorProps: DropDownDecoratorProps(
                decoration: InputDecoration(
                  labelStyle: TextStyle(height: 44),
                  border: OutlineInputBorder(),
                  labelText: 'Chọn ngân hàng',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              popupProps: PopupProps.menu(
                fit: FlexFit.loose,
                showSearchBox: true,
                itemBuilder: (context, item, isSelected, isDisabled) {
                  return ListTile(
                    leading: Icon(
                      Icons.account_balance,
                      color: isDisabled
                          ? Colors.grey.shade300
                          : isSelected
                          ? Colors.blue
                          : Colors.grey,
                    ),
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
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Chi nhánh",
              style: TextStyle(fontSize: 14, fontFamily: 'Nunito'),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(height: 44),
                border: OutlineInputBorder(),
                labelText: 'Nhập chi nhánh',
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Số tài khoản",
              style: TextStyle(fontSize: 14, fontFamily: 'Nunito'),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(height: 44),
                border: OutlineInputBorder(),
                labelText: 'Nhập số tài khoản',
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Chủ tài khoản",
              style: TextStyle(fontSize: 14, fontFamily: 'Nunito'),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(height: 44),
                border: OutlineInputBorder(),
                labelText: 'Nhập tên chủ tài khoản',
              ),
            ),
            SizedBox(height: 15),
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
                    style: TextStyle(fontSize: 14, fontFamily: 'Nunito'),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00B2FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Xác nhận',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
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
            const SizedBox(height: 30),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
