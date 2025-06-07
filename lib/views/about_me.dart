import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../globals/app_assets.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_style.dart';
import '../globals/constants.dart';
import '../helper_class/helper_class.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildAboutMeContents(),
        ],
      ),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents())
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents())
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  FadeInRight buildProfilePicture() {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          AppAssets.profile2,
          width: 500,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Column buildAboutMeContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: RichText(
            text: TextSpan(
              text: 'Sobre ',
              style: AppTextStyles.headingStyles(fontSize: 30.0),
              children: [
                TextSpan(
                  text: 'Neemias Felix',
                  style: AppTextStyles.headingStyles(
                      fontSize: 30, color: AppColors.robinEdgeBlue),
                )
              ],
            ),
          ),
        ),
        Constants.sizedBox(height: 6.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Gesseiro',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 8.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1600),
          child: Text(
            'Com 17 anos de vivência no ramo de gesso, trago a você a bagagem de uma trajetória que começou na Baixada Santista. Minha mudança para Minas Gerais ocorreu há mais de dez anos, e desde então, estabeleci residência em São Sebastião do Paraíso.Para seus projetos em drywall, pode contar com um profissional experiente. Realizo divisórias, forros, e sancas, entregando um trabalho de alto nível e com a dedicação que sua obra exige.',
            style: AppTextStyles.normalStyle(),
          ),
        ),
      ],
    );
  }
}