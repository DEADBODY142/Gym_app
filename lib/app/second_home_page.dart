import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/quote.dart';
import 'package:flutter_application_1/api/api_service.dart';
import 'package:flutter_application_1/commons/bottomnav.dart';

class SecondHomePage extends StatefulWidget {
  const SecondHomePage({super.key});

  @override
  State<SecondHomePage> createState() => _SecondHomePageState();
}

class _SecondHomePageState extends State<SecondHomePage> {
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Quote>? quote;
  bool isLoading = true;
  String? error;
  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    // print("hellop");
    fetchQuote();
  }

 Future<void> fetchQuote() async {
  setState(() {
    isLoading = true;
    error = null;
  });

  print("Fetching quote...");
  try {
    final fetchedQuote = await apiService.fetchQuote();
    print("Fetched data: $fetchedQuote");
    setState(() {
      quote = fetchedQuote;
      isLoading = false;
    });
  } catch (e) {
    setState(() {
      error = e.toString();
      isLoading = false;
    });
    print("Error fetching quote: $e");
  }
}


  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30, left: 10, right: 5),
            child: Row(
              children: [
                // IconButton(
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                //   icon: Icon(Icons.arrow_back_ios),
                // ),
                Expanded(
                  child: Text(
                    'Quotes',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child:
                isLoading
                    ? CircularProgressIndicator()
                    : quote != null
                    ?
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Card(
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                      )
                                        ),
                                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            quote![0].content,
                            style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              quote![0].author,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                                        ),
                                      ),
                    )
                    : Text("No quote found"),
          ),
        ],
      ),

            bottomNavigationBar: BottomNav(currentindex:_currentIndex,onItemTapped:_onItemTapped)

    );
  }
}
