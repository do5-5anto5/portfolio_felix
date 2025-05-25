import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_felix/globals/app_colors.dart';

import '../globals/app_assets.dart';
import '../globals/app_text_style.dart';
import '../globals/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: size.height * 0.3,
          left: size.width * 0.2,
          right: size.width * 0.2,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Olá, sou ',
                      style: AppTextStyles.montserratStyle(color: Colors.white),
                    ),
                    Constants.sizedBox(height: 15),
                    Text('Neemias Felix', style: AppTextStyles.headingStyles()),
                    Constants.sizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'E presto serviços em ',
                          style: AppTextStyles.montserratStyle(
                            color: Colors.white,
                          ),
                        ),
                        AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              'Dry Wall',
                              textStyle: AppTextStyles.montserratStyle(
                                color: Colors.lightBlue,
                              ),
                            ),
                            TyperAnimatedText(
                              'Steel Frame Design',
                              textStyle: AppTextStyles.montserratStyle(
                                color: Colors.lightBlue,
                              ),
                            ),
                            TyperAnimatedText(
                              'Gesso',
                              textStyle: AppTextStyles.montserratStyle(
                                color: Colors.lightBlue,
                              ),
                            ),
                          ],
                          pause: const Duration(milliseconds: 1000),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                      ],
                    ),
                    Constants.sizedBox(height: 15),
                    SizedBox(
                      width: size.width * 0.5,
                      child: Text(
                        'Em São Sebastião do Paraíso, conte com um gesseiro de confiança para seus projetos em drywall. Executo divisórias, forros, sancas e muito mais com eficiência, excelência e o padrão de qualidade que você merece.',
                        style: AppTextStyles.normalStyle(),
                      ),
                    ),
                    Constants.sizedBox(height: 22),
                    Row(
                      children: [
                        buildSocialButton(imageAsset: AppAssets.facebook),
                        Constants.sizedBox(width: 12),
                        buildSocialButton(imageAsset: AppAssets.instagram),
                        Constants.sizedBox(width: 12),
                        buildSocialButton(imageAsset: AppAssets.whatsapp),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Ink buildSocialButton({required String imageAsset}) {
    return Ink(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.themeColor, width: 2.0),
        color: AppColors.bgColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(500.0),
        splashColor: AppColors.aqua,
        hoverColor: AppColors.mCyan,
        onTap: () {},
        child: Image.asset(
          imageAsset,
          width: 10,
          height: 12,
          color: AppColors.themeColor,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
