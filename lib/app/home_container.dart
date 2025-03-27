import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  final List<String> imagePaths = [
    // 'assets/images/images.png',
    'assets/images/weightloss.jpg',
    'assets/images/bodybuild.jpg', 
    'assets/images/cardio.jpg',    
    'assets/images/pilates.jpeg',  
    'assets/images/meditate.jpg', 
    'assets/images/pullup.jpg', 
    'assets/images/stretch.jpg', 
  ];
  // const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.all(10),
            child: GridView.count(
    crossAxisCount: 2, //* 2 columns
    crossAxisSpacing: 10, //* Space between columns
    mainAxisSpacing: 10, //* Space between rows
    shrinkWrap: true, // ✅ Important to wrap inside Column
              physics: NeverScrollableScrollPhysics(),
    children: List.generate(imagePaths.length, (index) { // 6 containers
      return Container(
        decoration: BoxDecoration(
          // color: Colors.blueAccent,
          
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          imagePaths[index],
          fit: BoxFit.cover, // Fill the container
        ),
        ),
        );
    },
    ),),);
  }
}