import 'package:cash_back_infor/domain/entity/user.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key, required this.userData});

  final List<UserEntity> userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          'Hồ sơ học tập',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Color(0xFF333741),
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_rounded)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: [
                ...List.generate(
                  userData.length,
                  (i) => _buildUserCard(userData[i], 180),
                ),
                _addUserCard(180),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Nhập mã kích hoạt',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF3393FF),
                        color: Color(0xFF3393FF)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildUserCard(UserEntity user, double width) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
          color: const Color(0xFFE3F2FD),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(
          child: Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 196, 196, 196),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage('assets/image/ok.png'),
            ),
          ),
        ),
      ),
      const SizedBox(height: 12),
      Text(
        user.name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF333741),
        ),
      ),
    ],
  );
}

Widget _addUserCard(double width) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
          color: const Color(0xFFF2F4F7),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(child: Image.asset('assets/image/plus_icon.png')),
      ),
      const SizedBox(height: 12),
      Text(
        'Thêm',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFFD0D5DD),
        ),
      ),
    ],
  );
}
