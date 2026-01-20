import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseNotiDiaLogWidget extends StatelessWidget {
  const BaseNotiDiaLogWidget({
    super.key,
    required this.child,
    required this.imageUrl,
    required this.title,
    required this.height,
  });
  final Widget child;
  final String title;
  final String imageUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: Colors.white,
        ),
        height: height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: height - 4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(36),
                ),
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(imageUrl,height: 146,width: 176,),
                    SizedBox(height: 12,),
                    Text(
                      'Thông báo',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Color(0xFF4B4B4B))
                    ),
                    SizedBox(height: 12,),
                    Text(title, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xFF777777)), textAlign: TextAlign.center,),
                    SizedBox(height: 24),
                    child           
                  ],
                ),
              ),
            ),
            Positioned(
              top: -4,
              right: -4,
              child: GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(2),
                  child: const Icon(
                    Icons.cancel_rounded,
                    color: Color(0xFFAFAFAF),
                    size: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
