import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parallax_effect/utils/function.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import 'page_transformer.dart';
import 'parallex_card_widget.dart';
import 'utils/color.dart';
// import 'utils/function.dart';

List<String> swipingCardImages = [
  'assets/images/music/album7.jpg',
  'assets/images/music/album6.jpg',
  'assets/images/music/album5.jpg',
  'assets/images/music/album4.jpg',
  'assets/images/music/album3.jpg',
  'assets/images/music/album2.jpg',
  'assets/images/music/album1.jpg',
];

List<String> swipingCardTitles = [
  'Random Access Memories',
  'Voicenotes',
  'Stargazing',
  'Night Visions',
  'In A Perfect World',
  'Native',
];

class ParallaxCardItem {
  ParallaxCardItem({
    this.title,
    this.body,
    this.imagePath,
  });

  final String title;
  final String body;
  final String imagePath;
}

final parallaxCardItemsList = <ParallaxCardItem>[
  ParallaxCardItem(
    title: 'Luis Fonsi',
    body: 'Despacito',
    imagePath: 'assets/images/music/album1.jpg',
  ),
  ParallaxCardItem(
    title: 'Gangnam Style',
    body: 'Psy ',
    imagePath: 'assets/images/music/album2.jpg',
  ),
  ParallaxCardItem(
    title: 'NIGHT VISION',
    body: 'Imagine Dragons ',
    imagePath: 'assets/images/music/album3.jpg',
  ),
  ParallaxCardItem(
    title: 'Uptown Funk',
    body: 'Bruno Mars',
    imagePath: 'assets/images/music/album4.jpg',
  ),
  ParallaxCardItem(
    title: 'O.N.I.F.C',
    body: 'Wiz Khalifa',
    imagePath: 'assets/images/music/album5.jpg',
  ),
  ParallaxCardItem(
    title: 'My World 2.0',
    body: 'Justin Bieber',
    imagePath: 'assets/images/music/album6.jpg',
  ),
  ParallaxCardItem(
    title: 'Divide',
    body: 'Ed Sheeran',
    imagePath: 'assets/images/music/album7.png',
  ),
  ParallaxCardItem(
    title: 'Stars Dance',
    body: 'Selena Gomez',
    imagePath: 'assets/images/music/album8.jpg',
  ),
  ParallaxCardItem(
    title: 'LOUD',
    body: 'Rihanna',
    imagePath: 'assets/images/music/album9.jpg',
  ),
  ParallaxCardItem(
    title: 'Witness',
    body: 'Kate Perry',
    imagePath: 'assets/images/music/album10.jpg',
  ),
];

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;
var gradientStartColor;
var gradientEndColor;
PageController controller =
    PageController(initialPage: swipingCardImages.length - 1);
var i = swipingCardImages.length - 1;

class MyGradientsPage extends StatefulWidget {
  @override
  _MyGradientsPageState createState() => _MyGradientsPageState();
}

class _MyGradientsPageState extends State<MyGradientsPage> {
  var currentPage = swipingCardImages.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(initialPage: swipingCardImages.length - 1);
    controller.addListener(
      () {
        setState(
          () {
            currentPage = controller.page;
          },
        );
      },
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: 10.0,
              top: 50.0,
            ),
            child: GradientText(
              'Gradient Cards',
              shaderRect: Rect.fromLTWH(0.0, 0.0, 50.0, 50.0),
              gradient: isThemeCurrentlyDark(context)
                  ? Gradients.byDesign
                  : Gradients
                      .rainbowBlue, //gradient colors change according to set theme
              style: TextStyle(
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w600,
                fontSize: 22.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.0),
            child: SizedBox.fromSize(
              size: Size.fromHeight(500.0),
              child: PageTransformer(
                pageViewBuilder: (context, visibilityResolver) {
                  return PageView.builder(
                    controller: PageController(viewportFraction: 0.85),
                    itemCount: parallaxCardItemsList.length,
                    itemBuilder: (context, index) {
                      final item = parallaxCardItemsList[index];
                      final pageVisibility =
                          visibilityResolver.resolvePageVisibility(index);

                      return ParallaxCardsWidget(
                        item: item,
                        pageVisibility: pageVisibility,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
