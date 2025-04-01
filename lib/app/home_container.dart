import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/image_selection_provider.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class HomeContainer extends StatefulWidget {
  // final Function(int) onSelectionChanged;
  const HomeContainer({super.key});
  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
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
  // Set<int> selectedIndexes = {};

  // @override
  // void initState() {
  //   super.initState();
  //   _loadSelections();
  // }

  // // Load saved selection state from SharedPreferences
  // void _loadSelections() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   Set<String>? savedIndexes = prefs.getStringList('selectedIndexes')?.toSet() ?? {};

  //   // Convert saved string indexes to integer set
  //   setState(() {
  //     selectedIndexes = savedIndexes.map((e) => int.parse(e)).toSet();
  //   });
  //   widget.onSelectionChanged(selectedIndexes.length);
  // }

  // // Save selected indexes to SharedPreferences
  // void _saveSelections() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   Set<String> indexStrings = selectedIndexes.map((e) => e.toString()).toSet();
  //   await prefs.setStringList('selectedIndexes', indexStrings.toList());
  //   widget.onSelectionChanged(selectedIndexes.length);
  // }

  // // Toggle image selection and update SharedPreferences
  // void toggleSelection(int index) {
  //   setState(() {
  //     if (selectedIndexes.contains(index)) {
  //       selectedIndexes.remove(index);
  //     } else {
  //       selectedIndexes.add(index);
  //     }
  //   });
  //   _saveSelections();  // Save the new state to SharedPreferences
  // }

  // const HomeContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 2, //* 2 columns
        crossAxisSpacing: 10, //* Space between columns
        mainAxisSpacing: 10, //* Space between rows
        shrinkWrap: true, //
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(imagePaths.length, (index) {
          final provider = Provider.of<ImageSelectionProvider>(context);
          bool isSelected = provider.selectedIndexes.contains(index);

          return GestureDetector(
            onTap: () => provider.toggleSelection(index),
            child: Stack(
              children: [
                // Image Container
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: isSelected ? Colors.blue : Colors.transparent,
                      width: 3,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(imagePaths[index], fit: BoxFit.cover),
                  ),
                ),

                // Checkmark Overlay
                if (isSelected)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
