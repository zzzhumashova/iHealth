import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ihealthapp/common_widgets/build_text.dart';
import 'package:ihealthapp/features/homePage/disease_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<List<DiseaseInfo>> _filteredDiseases = [];
  int _currentCarouselIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    _filteredDiseases = List.from(allDiseases); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,  //улбош мында "кожные болезни","опух болехни","врожденные болезни" деген сиактылар канша вкладка екенын жазып отыру керек
        child: Column(
          children: [
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BuildCustomText(text: 'Добро пожаловать, Username!', fontSize: 24.0, fontWeight: FontWeight.bold),
                      const SizedBox(height: 8.0),
                      _buildSearchBar(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            _buildTabBar(),
            Expanded(
              child: _buildTabBarView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFBBF2EF)),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Поиск...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: InputBorder.none,
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          _searchController.clear();
                          _updateSearchResults('');
                        },
                      )
                    : null,
              ),
              onChanged: _updateSearchResults,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return const TabBar(
      labelColor: Colors.black,
      indicatorColor: Color.fromRGBO(187, 242, 239, 1),
      tabs: [
        Tab(
          child: BuildCustomText(text: 'Кожные болезни', fontSize: 16, ),
        ),
        Tab(
          child: BuildCustomText(text: 'Опухолевые болезни', fontSize: 16,),
        ),
        Tab(
          child: BuildCustomText(text: 'Врожденные болезни', fontSize: 16,),
        ),
      ],
    );
  }

  TabBarView _buildTabBarView() {
    return TabBarView(
      children: [
        buildTabContent(_filteredDiseases[0]),
        buildTabContent(_filteredDiseases[1]),
        buildTabContent(_filteredDiseases[2]),
      ],
    );
  }

  Widget buildTabContent(List<DiseaseInfo> diseases) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30,),
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 400.0, 
              enlargeCenterPage: true,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentCarouselIndex = index;
                });
              },
            ),
            items: diseases.map(
              (DiseaseInfo disease) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    disease.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 180.0, 
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      disease.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      disease.desc,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 220.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: Color(0xFFBBF2EF), width: 4.0),
                      ),
                      child: const Text(
                        'Подробнее',
                        style: TextStyle(
                          color: Color(0xFFBBF2EF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_currentCarouselIndex > 0) {
                    _carouselController.previousPage();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFFBBF2EF), width: 4.0),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Color(0xFFBBF2EF),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: diseases.map((disease) {
                  int index = diseases.indexOf(disease);
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _currentCarouselIndex = index;
                          _carouselController.animateToPage(index);
                        });
                      },
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == _currentCarouselIndex
                              ? const Color(0xFFBBF2EF)
                              : Colors.white,
                          border: Border.all(color: const Color(0xFFBBF2EF), width: 2.5),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: () {
                  if (_currentCarouselIndex < diseases.length - 1) {
                    _carouselController.nextPage();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFFBBF2EF), width: 4.0),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Color(0xFFBBF2EF),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }



  void _updateSearchResults(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredDiseases = List.from(allDiseases);
      } else {
        _filteredDiseases = allDiseases
            .map((diseaseList) => diseaseList
                .where((disease) =>
                    disease.title.toLowerCase().contains(query.toLowerCase()))
                .toList())
            .toList();
      }
    });
  }
}
