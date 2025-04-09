import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/home_container.dart';
import 'package:flutter_application_1/commons/bottomnav.dart';
// import 'package:flutter_application_1/app/signin.dart';
import 'package:flutter_application_1/providers/image_selection_provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isSelected = false; //* state variable should be here
  int _currentIndex = 0;
  void _onItemTapped(int index)
  {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ImageSelectionProvider>(context);
    final selectedCount = provider.selectedItemCount;
    final List<String> imagePath = provider.imagePaths;
    // final selectedIndexes = provider.selectedIndexes;

    double imgHeight = 100.0;
    double spacing = 20;
    double totalHeight =
        selectedCount > 0 ? (imgHeight + spacing) * selectedCount : 0;
    totalHeight = totalHeight > 200 ? totalHeight : 200;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          // Use Stack to properly place Positioned widgets
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 10, right: 5),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                      Expanded(
                        child: Text(
                          'Homepage',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Stack(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isSelected = !isSelected;
                                });
                                // If you wish to trigger an overlay, you can call _showOverlay here.
                              },
                              icon: Icon(Icons.checklist_rounded),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: CircleAvatar(
                                radius: 10,
                                child: Text(
                                  '$selectedCount',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 20, color: Colors.pink),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                          ),
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
                              SizedBox(height: 10),
                              Text(
                                'Choose your purposes and we will help you find best trainers & facilities',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        HomeContainer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            if (isSelected)
              Positioned(
                top: 60,
                width: 150,
                right: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 280),

                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:
                                  selectedCount == 0
                                      ? [
                                        Text(
                                          'No Image Selected!',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ]
                                      //?
                                      : provider.selectedIndexes.map((index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 10,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              provider.toggleSelection(index);
                                            },
                                            child: Stack(
                                              children: [
                                                SizedBox(
                                                  height: imgHeight,
                                                  child: Image.asset(
                                                    imagePath[index],
                                                    height: imgHeight,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 4,
                                                  right: 4,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            2,
                                                          ),
                                                    ),
                                                    width: 15,
                                                    child: Center(
                                                      child: Text(
                                                        (provider.selectedIndexes
                                                                    .toList()
                                                                    .indexOf(
                                                                      index,
                                                                    ) +
                                                                1)
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),

      //? Bottom Navigation Bar
      bottomNavigationBar: BottomNav(currentindex:_currentIndex,onItemTapped:_onItemTapped)
    );
        
  }
}
