import 'package:cash_back_infor/domain/entity/user.dart';
import 'package:cash_back_infor/features/theme/color_theme.dart';
import 'package:cash_back_infor/utils/text_define.dart';
import 'package:cash_back_infor/features/theme/text_decoration.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key, required this.userData});

  final List<UserEntity> userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          AppString.homeAppBarTitle,
          style: Theme.of(context).textTheme.bodyMedium?.homeAppBarTitle,
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
                  (i) => _buildUserCard(userData[i], 180, context),
                ),
                _addUserCard(180, context),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppString.homeActiveCodeTextButton,
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium?.homeActiveCodeTextButton,
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

Widget _buildUserCard(UserEntity user, double width, BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
          color: AppColor.homeUserCardBg,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(
          child: Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              color: AppColor.homeUserCardAvtBg,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage(AssetString.homeAssetAvt),
            ),
          ),
        ),
      ),
      const SizedBox(height: 12),
      Text(
        user.name,
        style: Theme.of(context).textTheme.labelMedium?.homeUserCardText
      ),
    ],
  );
}

Widget _addUserCard(double width, BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
          color: AppColor.homeAddCardBg,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(child: Image.asset(AssetString.homeAssetAdd)),
      ),
      const SizedBox(height: 12),
      Text(
        'Thêm',
        style: Theme.of(context).textTheme.labelMedium?.homeAddTextButton
      ),
    ],
  );
}
