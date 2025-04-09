import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/profiles.dart';
import 'package:flutter_application_1/api/api_service.dart';
import 'package:flutter_application_1/commons/bottomnav.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  List<Profiles>? profile;
  bool isLoading = true;
  String? error;
  ApiService apiService = ApiService();
  final url = ApiService().url;
  int currentId = 1;
  int page = 1;
  int _currentIndex = 2;
  

  @override
  void initState() {
    super.initState();
    fetchProfiles();
  }

  

  Future<void> fetchProfiles() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    print("Fetching profile...");
    try {
      final fetchedProfiles = await apiService.fetchProfiles(currentId);
      final pagenum = await apiService.fetchPageNumber();
      // final num = fetchedProfiles.length;
      print("Fetched data: $fetchedProfiles");
      setState(() {
        profile = fetchedProfiles;
        page = pagenum['totalPages'];
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
      print("Error fetching profiles: $e");
    }
  }
  
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Text(
              'Connect with a Trainer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                // Show loading indicator while fetching
                if (isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (error != null)
                  Center(child: Text('Error: $error'))
                else
                  // GridView is inside ListView to allow scrolling
                  GridView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: profile?.length ?? 0,
                    shrinkWrap: true, // GridView doesn't take extra space
                    physics: NeverScrollableScrollPhysics(), // Disable scroll inside GridView
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (context, index) {
                      final user = profile![index];
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              url + user.imagePath,
                              height: 100,
                              width: 100,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.error),
                            ),
                            const SizedBox(height: 10),
                            Text(user.name, style: const TextStyle(fontSize: 16)),
                          ],
                        ),
                      );
                    },
                  ),
                
                // Buttons will be displayed after the grid content
                if (!isLoading && profile != null && profile!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: currentId > 1
                              ? () {
                                  setState(() {
                                    currentId--;
                                  });
                                  fetchProfiles();
                                }
                              : null,
                          child: const Text('Previous'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: currentId < page ? () {
                            setState(() {
                              currentId++;
                            });
                            fetchProfiles();
                          }
                          : null,
                          child: const Text('Next'),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
          bottomNavigationBar: BottomNav(currentindex:_currentIndex,onItemTapped:_onItemTapped)

  );
}
}