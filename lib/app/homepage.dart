import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/home_container.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      body: SafeArea(
        child: Column(children: [
          Padding(
            
            padding: EdgeInsets.only(top:30, left:10,right: 5),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back_ios),),
                Expanded(
                  child: Text(
                    'Homepage',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  
                )
              ],
            ),
            
          ),
          Divider(
            height: 20,
            color: Colors.pink,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(top:10, left:10, right: 10),
                child: Column(
                  children: [
                    Text(
                      "And What's Your Goal?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Choose your purposes and we will help you find best trainers & facilites',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height:30),
              HomeContainer(),
                  
                ],
              ),
            ),
          )
          
        ],),
      ),
      
    );
  }
}