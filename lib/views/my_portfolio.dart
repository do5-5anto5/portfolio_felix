import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../globals/app_assets.dart';
import '../globals/app_colors.dart';
import '../globals/app_text_style.dart';
import '../globals/constants.dart';
import '../helper_class/helper_class.dart';

class MyPortfolio extends StatefulWidget {
  const MyPortfolio({super.key});

  @override
  State<MyPortfolio> createState() => _MyPortfolioState();
}

class _MyPortfolioState extends State<MyPortfolio> {
  final onH0verEffect = Matrix4.identity()..scale(1.0);

  List images = <String>[
    AppAssets.forro_sanca_fechada,
    AppAssets.forro_sancaaberta_cortes,
    AppAssets.parede_molduras_3d,
    AppAssets.divisorias,
    AppAssets.estrutura_complexa,
    AppAssets.fachada_glasroc,
  ];

  List titles = <String>[
    'Forro com Sanca fechada',
    'Forro com Sanca aberta e Cortes para Iluminação',
    'Parede revestida de Molduras 3D',
    'Divisórias',
    'Estrutura Complexa',
    'Fachada revestida com Glasroc',
  ];

  List<String> descriptions = <String>[
    'Forro de drywall com sanca fechada: rebaixo no teto com laterais contínuas, escondendo a iluminação LED que foca no centro. Gera luz indireta suave, com acabamento clean e sofisticado.',
    'Forro drywall sanca aberta e cortes: rebaixo com laterais abertas para luz indireta (LED) e nichos para embutidas. Cria iluminação versátil/dinâmica, unindo luz suave e pontos diretos.',
    'Parede molduras 3D gesso: superfície decorada com painéis de gesso que criam relevo/profundidade. Confere elegância, sofisticação e toque artístico, transformando a parede em destaque.',
    'Divisória drywall: parede interna leve, não estrutural (perfis metálicos/gesso acartonado). Rápida instalação, flexibilidade de layout, bom isolamento termoacústico, ideal para otimizar espaços.',
    'Kitnet LSF: estrutura com paredes internas/forros em drywall, e fachadas/elementos externos/banheiro revestidos em Glasroc. Combina leveza, agilidade e resistência a intempéries.',
    'Fachada Glasroc: revestimento externo com placas de gesso especiais (véu de vidro/polímero), resistentes a água/UV. Leve, durável, fácil instalação, aceita acabamentos. Moderna e eficiente.',
  ];

  var hoveredIndex;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 1),
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 2),
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProjectText(),
          Constants.sizedBox(height: 40.0),
          buildProjectGridView(crossAxisCount: 3),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  GridView buildProjectGridView({required int crossAxisCount}) {
    return GridView.builder(
      itemCount: images.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: 280,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemBuilder: (context, index) {
        var image = images[index];
        return FadeInUpBig(
          duration: const Duration(milliseconds: 1600),
          child: InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                if (value) {
                  hoveredIndex = index;
                } else {
                  hoveredIndex = null;
                }
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Visibility(
                  visible: index == hoveredIndex,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    transform: index == hoveredIndex ? onH0verEffect : null,
                    curve: Curves.easeIn,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.themeColor.withAlpha(1),
                          AppColors.themeColor.withAlpha(230),
                          AppColors.themeColor.withAlpha(304),
                          AppColors.themeColor.withAlpha(153),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: buildLastProjectsItem(
                      title: titles[index],
                      description: descriptions[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Column buildLastProjectsItem({
    required String title,
    required String description,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.montserratStyle(
            color: Colors.black87,
            fontSize: 20,
          ),
        ),
        Constants.sizedBox(height: 15.0),
        Text(
          description,
          style: AppTextStyles.normalStyle(color: Colors.black87),
          textAlign: TextAlign.center,
        ),
        Constants.sizedBox(height: 5.0),
        CircleAvatar(
          maxRadius: 25,
          backgroundColor: Colors.white,
          child: Image.asset(
            AppAssets.share,
            width: 25,
            height: 25,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  FadeInDown buildProjectText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Meus ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Projetos',
              style: AppTextStyles.headingStyles(
                fontSize: 30,
                color: AppColors.robinEdgeBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
