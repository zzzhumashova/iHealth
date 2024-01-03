import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ihealthapp/common_widgets/build_text.dart';
import 'package:ihealthapp/features/profilePage/build_profile_icons.dart';
import 'package:ihealthapp/features/profilePage/profile_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileMainPage extends StatefulWidget {
  const ProfileMainPage({super.key});

  @override
  State<ProfileMainPage> createState() => _ProfileMainPageState();
}

class _ProfileMainPageState extends State<ProfileMainPage> {
  String name = 'UserName!';
  String imagePath = 'assets/img/profile_image.webp'; 
 
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'UserName!';
      imagePath = prefs.getString('imagePath') ?? 'assets/img/profile_image.webp';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 85),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: FileImage(File(imagePath)),
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.center,
                    child: Text(name, style: const TextStyle(fontSize: 28.0)),
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileInfo()),
                        );
                      },
                      child: const BuildCustomText(text: 'Личная информация', fontSize: 16.0, color: Color.fromRGBO(0, 0, 0, 1)),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    width: 400,
                    height: 140,
                    padding: const EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(235, 235, 235, 1.0),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: BuildCustomText(text: 'Состояние здоровья', fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromRGBO(235, 235, 235, 1.0),
                                    width: 0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: BuildCustomProfileIcons(icon: Icons.favorite, color: Colors.red),
                              ),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromRGBO(235, 235, 235, 1.0),
                                    width: 0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: BuildCustomProfileIcons(icon: Icons.water_drop, color: Color.fromRGBO(187, 242, 239, 1)),
                              ),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromRGBO(235, 235, 235, 1.0),
                                    width: 0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: BuildCustomProfileIcons(icon: Icons.bed, color: Colors.orange),
                              ),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromRGBO(235, 235, 235, 1.0),
                                    width: 0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: BuildCustomProfileIcons(icon: Icons.health_and_safety, color: Colors.green),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 400,
                    height: 180,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(235, 235, 235, 1.0),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BuildCustomText(text: 'Шаги', fontWeight: FontWeight.bold),
                        const SizedBox(height: 10),
                        const BuildCustomText(text: 'Всреднем вы проходите на 2 451 шаг меньше в день на этой неделе, чем на прошлой', fontSize: 14),
                        const SizedBox(height: 15),
                        const BuildCustomText(text: '6781 шагов в неделю', fontSize: 12, color: Color.fromRGBO(0, 0, 0, 1),),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: LinearProgressIndicator(
                              value: 0.3,
                              backgroundColor: Colors.grey[300],
                              color: const Color.fromRGBO(187, 242, 239, 1),
                              minHeight: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 400,
                    height: 180,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(235, 235, 235, 1.0),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BuildCustomText(text: 'Последние действия', fontWeight: FontWeight.bold,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromRGBO(235, 235, 235, 1.0),
                                    width: 0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: Icon(Icons.favorite, size: 45, color: Colors.red),
                              ),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromRGBO(220, 220, 220, 1.0),
                                    width: 0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: Icon(Icons.water_drop,
                                    size: 45, color: Color.fromRGBO(187, 242, 239, 1)),
                              ),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromRGBO(235, 235, 235, 1.0),
                                    width: 0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: Icon(Icons.bed,
                                    size: 45, color: Colors.orange),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}