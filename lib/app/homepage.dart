import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/home_container.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  OverlayEntry? _overlayEntry;
  int selectedItemCount = 0;
  void _showOverlay(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            top: 100,
            height: 200,
            // left: 100,
            right: 10,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.grey,
                child: Text(
                  'This is an overlay!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
    );
    Overlay.of(context)?.insert(_overlayEntry!);
  }
    void _removeOverlay() {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }

    void _updateSelectionCount(int count){
      setState(() {
        selectedItemCount = count;
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, left: 10, right: 5),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
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
                        IconButton(onPressed: () {
                          if(_overlayEntry==null)
                          {
                            _showOverlay(context);
                          }
                          else
                          {
                            _removeOverlay();
                          }
                        }, icon: Icon(Icons.checklist_rounded)),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: CircleAvatar(
                            radius: 10,
                            child: Text(
                              '$selectedItemCount',
                              style: TextStyle(color: Colors.blue),
                            )
                          )
                        )
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
                      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
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
                            'Choose your purposes and we will help you find best trainers & facilites',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    HomeContainer(onSelectionChanged:_updateSelectionCount),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
