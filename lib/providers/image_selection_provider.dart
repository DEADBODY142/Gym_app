import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageSelectionProvider extends  ChangeNotifier {
  final List<String> _imagePaths = [
          // 'assets/images/images.png',
          'assets/images/weightloss.jpg',
          'assets/images/bodybuild.jpg',
          'assets/images/cardio.jpg',
          'assets/images/pilates.jpeg',
          'assets/images/meditate.jpg',
          'assets/images/pullup.jpg',
          'assets/images/stretch.jpg',
        ];

  List<String> get imagePaths=>_imagePaths;
  Set<int> _selectedIndexes = {};

  Set<int> get selectedIndexes => _selectedIndexes;

  int get selectedItemCount => _selectedIndexes.length;

  ImageSelectionProvider() {
    _loadSelections();
  }

    void toggleSelection(int index) {
      if (_selectedIndexes.contains(index)) {
        _selectedIndexes.remove(index);
      } else {
        _selectedIndexes.add(index);
      }
      _saveSelections();
      notifyListeners();
    }

    Future<void> _loadSelections() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String>? savedIndexes = prefs.getStringList('selectedIndexes')?.toSet() ?? {};
    _selectedIndexes = savedIndexes.map((e) => int.parse(e)).toSet();
    notifyListeners();
  }

  Future<void> _saveSelections() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> indexStrings = _selectedIndexes.map((e) => e.toString()).toSet();
    await prefs.setStringList('selectedIndexes', indexStrings.toList());
  }
  }