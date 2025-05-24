import 'package:flutter/material.dart';
import 'package:portfolio_felix/globals/app_colors.dart';

import '../globals/app_text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        toolbarHeight: 90,
        titleSpacing: 100,
        elevation: 0,
        title: Row(
          children: [
            Text('Portfolio', style: AppTextStyles.headerTextStyle()),
            const Spacer(),
            Text('Home', style: AppTextStyles.headerTextStyle()),
            const SizedBox(width: 30),
            Text('Sobre', style: AppTextStyles.headerTextStyle()),
            const SizedBox(width: 30),
            Text('Serviços', style: AppTextStyles.headerTextStyle()),
            const SizedBox(width: 30),
            Text('Portfolio', style: AppTextStyles.headerTextStyle()),
            const SizedBox(width: 30),
            Text('Contato', style: AppTextStyles.headerTextStyle()),
          ],
        ),
      ),
    );
  }
}
