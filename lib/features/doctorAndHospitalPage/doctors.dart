// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:ihealthapp/features/doctorAndHospitalPage/hospitals.dart';

class Doctor {
  final String name;
  final String specialty;
  final double rating;
  final String imageUrl;

  Doctor(this.name, this.specialty, this.rating, this.imageUrl);
}

final List<Doctor> doctorsList = [
  Doctor('Иванов И.И.', 'Кардиолог', 9.8, 'https://placekitten.com/200/200'),
  Doctor('Петрова А.С.', 'Терапевт', 9.5, 'https://placekitten.com/200/201'),
  Doctor('Сидорова Е.В.', 'Педиатр', 9.7, 'https://placekitten.com/200/202'),
];

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({Key? key}) : super(key: key);

  @override
  _DoctorsPageState createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  String dropdownValue = 'Врачи';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownButton<String>(
          value: dropdownValue,
          underline: Container(height: 0),
          onChanged: (String? newValue) {
            if (newValue != null && newValue != dropdownValue) {
              setState(() {
                dropdownValue = newValue;
              });
              if (newValue == 'Больницы') {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HospitalsPage(),
                ));
              }
            }
          },
          items: <String>['Врачи', 'Больницы']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DoctorsSearch(doctorsList),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: doctorsList.length,
        itemBuilder: (context, index) {
          final doctor = doctorsList[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(doctor.imageUrl),
              ),
              title: Text(doctor.name),
              subtitle: Text(doctor.specialty),
              trailing: Text('Рейтинг: ${doctor.rating.toString()}'),
            ),
          );
        },
      ),
    );
  }
}

class DoctorsSearch extends SearchDelegate {
  final List<Doctor> doctors;

  DoctorsSearch(this.doctors);

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
    final results = doctors.where((doctor) {
      return doctor.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final doctor = results[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(doctor.imageUrl),
            ),
            title: Text(doctor.name),
            subtitle: Text(doctor.specialty),
            trailing: Text('Рейтинг: ${doctor.rating.toString()}'),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = doctors.where((doctor) {
      return doctor.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final doctor = suggestions[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(doctor.imageUrl),
          ),
          title: Text(doctor.name),
          subtitle: Text(doctor.specialty),
        );
      },
    );
  }
}

void main() {
  runApp(const MaterialApp(home: DoctorsPage()));
}
