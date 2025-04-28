import 'dart:ui';

import 'package:flutter/material.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 38,
                margin: EdgeInsets.only(left: 20, top: 32, right: 20, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('menu.png'),
                    Text('Juegiux.', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800)),
                    Image.asset('bag.png')
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 100),
                    itemBuilder: (context, index) {
                      final juice = juiceList[index];
                      return JuiceWidget(
                        juice,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => JuiceDetailsPage(juice)));
                        },
                      );
                    },
                    itemCount: juiceList.length,
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              child: Container(
                color: Colors.white.withOpacity(0.2),
                height: 64,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('Home.png'),
                      Image.asset('Search.png'),
                      Image.asset('Heart.png'),
                      Image.asset('account.png'),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  MyButton({
    Key? key,
    required this.text,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0, backgroundColor: bgColor,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
    );
  }
}

final juiceList = [
  JuiceEntity(
    name: 'Super Paper Mario',
    image: 'assets/SuperPaper.jpg',
    fullImage: 'assetd/SuperPaper.jpg',
    price: '59.99',
    color: Color.fromARGB(255, 243, 234, 57),
  ),
  JuiceEntity(
    name: 'Sonic Adventure',
    image: 'assets/SA.jpg',
    fullImage: 'asstes/SA.jpg',
    price: '59.99',
    color: Color.fromARGB(255, 17, 0, 255),
  ),
  JuiceEntity(
    name: 'Ace Attorney Investigations 2',
    image: 'assets/ACI2.jpg',
    fullImage: 'assets/ACI2.jpg',
    price: '39.99',
    color: Color.fromARGB(255, 195, 7, 7),
  ),
  JuiceEntity(
    name: 'Bayonetta 1',
    image: 'assets/Bayonetta.webp',
    fullImage: 'assets/Bayonetta.webp',
    price: '29.99',
    color: Color.fromARGB(255, 107, 0, 0),
  ),
];

class JuiceEntity {
  final String name;
  final String image;
  final String fullImage;
  final String price;
  final Color color;

  JuiceEntity({
    required this.name,
    required this.image,
    required this.fullImage,
    required this.price,
    required this.color,
  });
}

class JuiceWidget extends StatelessWidget {
  final JuiceEntity juice;
  final VoidCallback? onTap;

  const JuiceWidget(this.juice, {this.onTap});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
    return AspectRatio(
      aspectRatio: 1.25,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final topPadding = constraints.maxHeight * 0.2;
          final leftPadding = constraints.maxWidth * 0.1;
          final imageWidth = constraints.maxWidth * 0.35;
          return GestureDetector(
            onTap: onTap,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: topPadding),
                  decoration: BoxDecoration(color: juice.color, borderRadius: BorderRadius.circular(24)),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              juice.name,
                              style: textStyle.copyWith(fontSize: 20),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '\$',
                                    style: textStyle.copyWith(fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: juice.price,
                                    style: textStyle.copyWith(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              width: 80,
                              child: MyButton(
                                text: 'Buy Now',
                                textColor: juice.color,
                              ),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.only(
                          top: topPadding,
                          left: leftPadding,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: imageWidth,
                      child: Image.network(juice.image),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class JuiceDetailsPage extends StatefulWidget {
  final JuiceEntity juice;

  const JuiceDetailsPage(this.juice);

  @override
  _JuiceDetailsPageState createState() => _JuiceDetailsPageState();
}

class SimpleRatingBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          color: Color(0xFFFFBA00),
          size: 18,
        ),
      ),
    );
  }
}

final List<String> reviewImages = [
  'assets/Adagio.jpg',
  'assets/Taills.webp',
  'assets/Marcy.jpg',
  'assets/franziska.jpg',
];
final addImageUrl = 'assets/add.png';

class ReviewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, index) => SizedBox(width: 18),
        itemBuilder: (_, index) {
          if (index == reviewImages.length) {
            return Image.network(addImageUrl);
          }

          return Image.network(reviewImages[index]);
        },
        itemCount: reviewImages.length + 1,
      ),
    );
  }
}

class _JuiceDetailsPageState extends State<JuiceDetailsPage> {
  var count = 0;
  double bottomSectionHeight = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(bottom: bottomSectionHeight),
            children: [
              AspectRatio(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final imageHeight = constraints.maxHeight * 0.7;
                    final imageHorizontalMargin = constraints.maxWidth * 0.15;
                    final imageBottomMargin = constraints.maxHeight * 0.07;
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: widget.juice.color,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: imageHorizontalMargin,
                                right: imageHorizontalMargin,
                                bottom: imageBottomMargin,
                              ),
                              child: Image.asset(
                                'SuperPaper.jpg',
                                height: imageHeight,
                              ),
                            ),
                          ),
                          margin: EdgeInsets.only(bottom: 26),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CounterWidget(
                            currentCount: count,
                            color: widget.juice.color,
                            onIncreaseClicked: () {
                              setState(() {
                                count++;
                              });
                            },
                            onDecreaseClicked: () {
                              setState(() {
                                count--;
                              });
                            },
                          ),
                        )
                      ],
                    );
                  },
                ),
                aspectRatio: 0.86,
              ),
              SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Super Paper Mario',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SimpleRatingBar()
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Super Paper Mario es un videojuego de rol de acción (RPG) de 2007 desarrollado por Intelligent Systems y publicado por Nintendo para Wii. Es la tercera entrega de la serie Paper Mario y el primero de la saga Mario que se lanza para Wii. El juego sigue a Mario, Peach, Bowser y Luigi mientras intentan recolectar los Corazones Puros y evitar que el Conde Cenizo y sus secuaces destruyan el universo.',
                      style: TextStyle(color: Color(0xFFB0B1B4), fontSize: 16),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reviews',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'See all',
                          style: TextStyle(
                            color: Color(0xFFD81C33),
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    ReviewsList(),
                  ],
                ),
              )
            ],
          ),
          Container(
            color: widget.juice.color,
            padding: EdgeInsets.only(left: 24, right: 24, top: 26, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Image.asset(
                    'back.png',
                    width: 32,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                Text(
                  'Juegiux',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                Image.asset(
                  'shop_white.png',
                  width: 32,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: bottomSectionHeight,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: '\$',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '59.99',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 48,
                    child: MyButton(
                      text: 'Buy Now',
                      bgColor: widget.juice.color,
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  final int currentCount;
  final Color color;
  final VoidCallback? onIncreaseClicked;
  final VoidCallback? onDecreaseClicked;
  final textStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18);

  CounterWidget({
    required this.currentCount,
    required this.color,
    this.onIncreaseClicked,
    this.onDecreaseClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 16),
          GestureDetector(child: Icon(Icons.remove, color: Colors.white), onTap: onDecreaseClicked),
          SizedBox(width: 10),
          SizedBox(
            width: 30,
            child: Text(
              currentCount.toString(),
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(child: Icon(Icons.add, color: Colors.white), onTap: onIncreaseClicked),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}