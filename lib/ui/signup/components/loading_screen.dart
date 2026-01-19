import 'package:flutter/material.dart';

class FakeLoadingWidget extends StatelessWidget {
  const FakeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.all(44),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            maxLines: null,
            "Monkey đang cập nhật dữ liệu học tập của bé",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Color(0xFF4B4B4B)),
          ),
          SizedBox(height: 56),
          Image.asset('assets/image/fake_loading.png'),
          SizedBox(height: 66),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Color(0xFF36BFFA)),
                    Expanded(
                      child: Text(
                        maxLines: null,
                        'Cập nhật thông tin tài khoản sử dụng',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Color(0xFF36BFFA),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Color(0xFF36BFFA)),
                    Text(
                      textAlign: TextAlign.center,
                      maxLines: null,
                      'Cập nhật hồ sơ học tập',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Color(0xFF36BFFA),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Color(0xFF36BFFA)),
                    Text(
                      textAlign: TextAlign.center,
                      maxLines: null,
                      'Cập nhật thông tin gói học',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Color(0xFF36BFFA),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
