import 'package:flutter/material.dart';
import 'package:flutter_application_1/network/api_popular.dart';

class PopularScreen extends StatefulWidget{
  const PopularScreen({super.key});

@override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {

  void initState(){
    super.initState();
    apiPopular = ApiPopular();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), //Builer = retorna un widget
      body: FutureBuilder(
        future: apiPopular!.getPopularMovies(), 
        builder: (context,snapshot) { //ListView.builder cuando no se saben los elementos de la lista. Sin builder, sí se sabe cuantos
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data![index].title);
              },
            );
          }else{
            if(snapshot.hasError){
              return Center(child: Text("ALgo ocurrió mal :()"),);
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          }
        }
        ),
    );
  }

}