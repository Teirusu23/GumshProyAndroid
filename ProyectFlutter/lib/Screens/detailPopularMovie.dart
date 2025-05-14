import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/popular_model.dart'; //statefulW = pone toda la cosa

class DetailPopularMovie extends StatefulWidget {
  const DetailPopularMovie({super.key});

  @override
  State<DetailPopularMovie> createState() => _DetailPopularMovie();
}

class _DetailPopularMovie extends State<DetailPopularMovie> {
  @override
  Widget build(BuildContext context) {
    final popular = ModalRoute.of(context)!.settings.arguments as PopularModel;
    
    return Container();
  }
}