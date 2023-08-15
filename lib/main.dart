import 'dart:async';
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:game/button.dart';
import 'package:game/girl.dart';
import 'package:game/pet.dart';
import 'package:game/salyangoz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Salyangozun değerleni burda yazıyom
  int salySpriteCount = 1;
  double salyangozPosx = 0.9;
  String salyDirection = 'left';
  int salySpriteCountdie = 5;
  /// 



  ///petin yanı geyiğin hareketlerini burda işlicez
  int petSpriteCount = 1;
  double petPosx = -0.5;
  String petDirection = 'right';
  ///
  


  ///kızın başlangıç şeysileri
  
  int girlSpriteCount = 1;
  double girlPosx = -0.9;
  String girlDirection = 'right';
  int attackGirlSpriteCount = 7;
  double girlPosy = 1;
  bool isJumping = false;


  ///yükleme ekranı rengi
  Color  loadingScreenColor  = Colors.green;
  int loadingTime = 3;
  Color loadingScreenColorText = Colors.black;
  ///


  ///
  void startGame(){
    moveSaly();
    movePet();
    moveGirl();
    startGameTimer();
  }

  ///
  





  ///
   void startGameTimer(){
    Timer.periodic(const Duration(seconds: 1), (timer) { 
     setState(() {
       loadingTime--;
     });
      if (loadingTime == 0) {
        setState(() {
          loadingScreenColor = Colors.transparent;
          loadingTime = 3;
          loadingScreenColorText = Colors.transparent;
        });
        timer.cancel();
      }

    });
   }
  ///
  



  ///
  
  void moveGirl(){
    Timer.periodic(const Duration(milliseconds: 400), (timer) {
      setState(() {
        girlSpriteCount++;

        if (girlSpriteCount == 4) {
          girlSpriteCount = 1;
        }
        if (girlSpriteCount > 7) { 
        girlSpriteCount = 1;
      }
      });
     });
  }
  /// 
  



  ///
  
  void jump(){
    setState(() {
         // Zıplama işlemi devam ediyorsa tekrar zıplamayı engelle
    if (isJumping) return;

    setState(() {
      isJumping = true;
      girlPosy -= 0.3; // Zıplama yüksekliği
    });

    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        if (girlDirection == 'left') {
          girlPosx -= 0.03;
        }else{
          girlPosx += 0.03;
        }
         // Yatay hareket devam eder
      });

      // Zıplama süresi tamamlandığında karakterin yerine düşmesini sağla
      if (girlPosy >= 1) {
        girlPosy = 1;
        isJumping = false;
        timer.cancel();
      } else {
        girlPosy += 0.01; // Zıplama hızı
      }
    });

    
    });   
  }
  /// 
 



  ///
  
  void movePet(){
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      setState(() {
        petSpriteCount++;

        if (petSpriteCount == 23) {
          petSpriteCount = 1;
        }

        if((petPosx - girlPosx).abs()> 0.2){
          if (girlDirection == 'right') {
            petPosx = girlPosx -0.2;
          }else if(girlDirection == 'left'){
            petPosx = girlPosx +0.2;
          }
        }

        if (petPosx - girlPosx > 0) {
          petDirection = 'left';
        } else {
          petDirection = 'right'; 
        }
      });
     });
  }
  ///

  ///saluyangozun hareketi 
  void moveSaly(){
    Timer.periodic(const Duration(milliseconds: 370), (timer) {
      setState(() {
        salySpriteCount++;

        if (salyDirection == 'left') {
          salyangozPosx -= 0.01;
        }else{
          salyangozPosx += 0.01; 
        }



        if (salyangozPosx<-0.3) {
          salyDirection = 'right';

        } else if(salyangozPosx > 0.9){
          salyDirection = 'left';
        }


        if (salySpriteCount == 5) {
          salySpriteCount = 1; 
        }   

          if (salySpriteCount > 8) { 
             salySpriteCount = 1;
      }  

      if (girlPosx == salyangozPosx ) {
        print('demage');
      }  
      });
     });
  }
  ///
  

  ///
  void deidSaly(){
    setState(() {
      salySpriteCount = 4;
       salySpriteCount ++;

       if (salySpriteCount > 8) { 
        salySpriteCount = 1;
      }
    });
  }
  ///




  ///bu da sola gitme animasyonu şeysi
  void moveLeft(){
    setState(() {
       girlSpriteCount = 4;
      girlPosx -= 0.03;
      girlDirection = 'left';
      girlSpriteCount ++;

       if (girlSpriteCount > 7) { 
        girlSpriteCount = 4;
      }

      
    });    
      
    
  }
  ///
  


  ///
   void moveRight(){
    setState(() {
       girlSpriteCount = 4;
      girlPosx += 0.03;
      girlDirection = 'right';
      girlSpriteCount ++;

       if (girlSpriteCount > 7) { 
        girlSpriteCount = 4;
      }
    }); 
    
  }
  ///
  


  ///
  void attack(){
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        attackGirlSpriteCount++;
      });
      if (attackGirlSpriteCount == 12) {

        if (girlDirection == 'right' && girlPosx + 0.2 > salyangozPosx) {
          print('hit');
          deidSaly();

        }else{
          print('missed');
        }
        attackGirlSpriteCount = 1;
        timer.cancel();
      }
      girlSpriteCount = attackGirlSpriteCount;
     });
  }
  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.lightBlueAccent,
            child: Stack(
              
              children: [

                Stack(
                  alignment: const Alignment(0, 0),
                 
                  children: [ Image.asset('lib/images/agac.png')],
                ),


                ///salyangoz
                Container(
                  alignment: Alignment(salyangozPosx, 1),
                  child: Salyangoz(
                      salySpriteCount: salySpriteCount,
                      salyDirection: salyDirection
                      ),
                ),

                ///geyik
                

                 Container(
                  alignment: Alignment(petPosx, 1),
                  child: Pet(
                      petSpriteCount: petSpriteCount,
                      petDirection: petDirection
                      ),
                ),


                ///
                
                Container(
                  alignment: Alignment(girlPosx, girlPosy),
                  child: Girl(
                      girlDirection:girlDirection ,
                      girlSpriteCount:girlSpriteCount,
                      ),
                ),


                ///
                
                Container(
                  color: loadingScreenColor,
                  child: Center(
                    child: Container(
                      child: Center(
                        child: Text(loadingTime.toString(),style: TextStyle(color: loadingScreenColorText,fontSize: 30,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                ),

                ///
      
          
              ],
            ),
          ),
        ),
        Container(
          height: 10,
          color: Colors.green,
        ),
        Expanded(
          child: Container(
            color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'İLK OYUN DENEMEM',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 155, 196, 157)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      function: () {
                        startGame();
                      },
                      text: 'Oyna',
                    ),
                    MyButton(
                      function: () {
                        moveLeft();
                      },
                      text: '<--',
                    ),
                    MyButton(
                      function: () {
                        jump();
                      },
                      text: '^',
                    ),
                    MyButton(
                      function: () {
                        moveRight();
                      },
                      text: '-->',
                    ),
                    MyButton(
                      function: () {
                        attack();
                      },
                      text: 'saldır',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
