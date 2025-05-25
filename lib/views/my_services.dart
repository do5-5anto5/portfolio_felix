import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../globals/app_assets.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_style.dart';
import '../globals/constants.dart';
import '../helper_class/helper_class.dart';

class MyServices extends StatefulWidget {
  const MyServices({super.key});

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  bool residential = false, business = false, special = false;

  final onHoverActive = Matrix4.identity()..translate(0, -10, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    const String residentialText = 'Transformo seu lar com drywall: divisórias e forros. Agilidade, limpeza e perfeição nos acabamentos para um ambiente funcional e estiloso.';
    const String businessText = 'Desenvolvo projetos de drywall para empresas: paredes, divisórias e forros que otimizam o espaço e a produtividade. Reformas e construções ágeis, limpas e duradouras.';
    const String specialText = 'Meu serviço vai além do básico, focando em acabamentos finos e reformas personalizadas. Faço nivelamento, correção de imperfeições e crio sancas, cortineiros, móveis e outros elementos decorativos em drywall. Qualidade duradoura.';
    return HelperClass(
      mobile: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                residential = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'Drywall Residencial',
              asset: AppAssets.house,
              hover: residential,
              text: residentialText,
            ),
          ),
          Constants.sizedBox(height: 24.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                business = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'Drywall Comercial e Corporativo',
              asset: AppAssets.business,
              hover: business,
              text: businessText,
            ),
          ),
          Constants.sizedBox(height: 24.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                special = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'Soluções Especiais em Drywall',
              asset: AppAssets.building,
              hover: special,
              text: specialText,
            ),
          )
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    residential = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Drywall Residencial',
                  asset: AppAssets.house,
                  hover: residential,
                  text: residentialText
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    business = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Drywall Comercial e Corporativo',
                  asset: AppAssets.business,
                  hover: business,
                  text: businessText
                ),
              ),
            ],
          ),
          Constants.sizedBox(height: 26.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                special = value;
              });
            },
            child: buildAnimatedContainer(
              title: 'Soluções Especiais em Drywall',
              asset: AppAssets.building,
              hover: special,
              text: specialText,
              width: 725.0,
              hoverWidth: 735.0,
            ),
          )
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    residential = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Drywall Residencial',
                  asset: AppAssets.house,
                  hover: residential,
                  text: residentialText
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    business = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Drywall Comercial e Corporativo',
                  asset: AppAssets.business,
                  hover: business,
                  text: businessText
                ),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    special = value;
                  });
                },
                child: buildAnimatedContainer(
                  title: 'Soluções Especiais em Drywall',
                  asset: AppAssets.building,
                  hover: special,
                  text: specialText,
                ),
              )
            ],
          ),
        ],
      ),
      paddingWidth: size.width * 0.04,
      bgColor: AppColors.bgColor,
    );
  }

  FadeInDown buildMyServicesText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Meus ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Serviços:',
              style: AppTextStyles.headingStyles(
                  fontSize: 30.0, color: AppColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer({
    required String title,
    required String asset,
    required bool hover,
    required String text,
    double width = 350,
    double hoverWidth = 360,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: hover ? hoverWidth : width,
      height: hover ? 390 : 380,
      alignment: Alignment.center,
      transform: hover ? onHoverActive : onHoverRemove,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.bgColor2,
        borderRadius: BorderRadius.circular(30),
        border:
        hover ? Border.all(color: AppColors.themeColor, width: 3) : null,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 4.0,
            blurRadius: 4.5,
            offset: Offset(3.0, 4.5),
          )
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            asset,
            width: 50,
            height: 50,
            color: AppColors.themeColor,
          ),
          Constants.sizedBox(height: 30.0),
          Text(
            title,
            style: AppTextStyles.montserratStyle(
                color: Colors.white, fontSize: 22.0),
          ),
          Constants.sizedBox(height: 12.0),
          Text(text,
            style: AppTextStyles.normalStyle(fontSize: 14.0),
            textAlign: TextAlign.center,
          ),
          Constants.sizedBox(height: 20.0)
        ],
      ),
    );
  }
}