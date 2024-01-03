import 'package:flutter/material.dart';
import 'package:ihealthapp/features/profilePage/profile_info.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(top: 24),
          child: Text(
            'Настройки',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            iconSize: 20,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileInfo()),
              );
            },
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height:30),
              Container(
                width: screenWidth * 0.9,
                height: 50,
                decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(235, 235, 235, 1),
                            width: 1, 
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Язык',
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15,),
                      child: SizedBox(width: 14, height: 7,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: screenWidth * 0.9,
                height: 50, 
                decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(235, 235, 235, 1),
                            width: 1, 
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Тема',
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15,),
                      child: SizedBox(
                        width: 14, 
                        height: 7, 
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: screenWidth * 0.9,
                height: 50, 
                decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(235, 235, 235, 1),
                            width: 1, 
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Безопасность',
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.w500,
                          color: Colors.black, 
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15,),
                      child: SizedBox(
                        width: 14,
                        height: 7,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                          size: 20, 
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}