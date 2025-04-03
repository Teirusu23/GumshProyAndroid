import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController conUser = TextEditingController();
  TextEditingController conPdw = TextEditingController();
  bool isLoading = false;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/SonicCD.jpg')
          )
        ),
        child: Stack(
          
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 100,
              child: Image.asset('assets/CDLogo.png', width: 350,)
            ),
            Positioned(
              bottom: 250,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                width: 400,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      controller: conUser,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text('Nombre de usuario'),
                        border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: conPdw,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Contraseña',
                        border: OutlineInputBorder()
                      ),
                    )
                  ],
                ),
              )
            ),
            Positioned(
              top: 660,
              child: InkWell(
                onTap: (){
                  isLoading = true;
                  setState(() { });
                  Future.delayed(Duration(seconds: 4)).then((value){
                  Navigator.pushNamed(context, '/dash');
                  },); //hilo
                },

                child: Lottie.asset('assets/boton.json', width: 220)
              )
            ),
            Positioned(
              top: 250,
              child: isLoading 
                ? Image.asset("assets/loading.gif", height: 400,) 
                : Container()
            )
          ],
        ),
      ),
    );
  }
}