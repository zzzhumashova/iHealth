import 'package:flutter/material.dart';

class Hospital {
  final String name;
  final String location;

  Hospital(this.name, this.location);
}

final List<Hospital> hospitalsList = [
  Hospital('Городская больница №1', 'Город А'),
  Hospital('Больница им. Смирнова', 'Город Б'),
  Hospital('Клиника Здоровья', 'Город В'),
];

class HospitalsPage extends StatefulWidget {
  const HospitalsPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HospitalsPageState createState() => _HospitalsPageState();
}

class _HospitalsPageState extends State<HospitalsPage> {
  List<Hospital> displayedHospitals = hospitalsList;

  // ignore: unused_element
  void _search(String query) {
    final suggestions = hospitalsList.where((hospital) {
      final hospitalName = hospital.name.toLowerCase();
      final input = query.toLowerCase();

      return hospitalName.contains(input);
    }).toList();

    setState(() {
      displayedHospitals = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Больницы'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: HospitalsSearch(hospitalsList),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: displayedHospitals.length,
        itemBuilder: (context, index) {
          final hospital = displayedHospitals[index];
          return Card(
            child: ListTile(
              title: Text(hospital.name),
              subtitle: Text('Местоположение: ${hospital.location}'),
            ),
          );
        },
      ),
    );
  }
}

class HospitalsSearch extends SearchDelegate {
  final List<Hospital> hospitals;

  HospitalsSearch(this.hospitals);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = hospitals.where((hospital) {
      return hospital.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final hospital = results[index];
        return Card(
          child: ListTile(
            title: Text(hospital.name),
            subtitle: Text('Местоположение: ${hospital.location}'),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = hospitals.where((hospital) {
      return hospital.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final hospital = suggestions[index];
        return ListTile(
          title: Text(hospital.name),
          subtitle: Text('Местоположение: ${hospital.location}'),
        );
      },
    );
  }
}
