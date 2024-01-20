import 'package:flutter/material.dart';
import 'package:ihealthapp/common_widgets/build_text.dart'; // Убедитесь, что у вас есть этот виджет

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  String selectedLanguage = 'Русский';
  String selectedTheme = 'Светлая тема';
  String selectedSecurity = 'Key';

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: const Text('Выберите язык'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: ['Русский', 'Казахский'].map((String language) {
                  return ListTile(
                    title: Text(language),
                    trailing: selectedLanguage == language
                        ? const Icon(Icons.check, color: Colors.black)
                        : null,
                    onTap: () {
                      setState(() {
                        selectedLanguage = language;
                      });
                    },
                  );
                }).toList(),
              ),
            );
          },
        );
      },
    );
  }

  void _showThemeDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: const Text('Выберите тему'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: ['Светлая тема', 'Темная тема'].map((String theme) {
                  return ListTile(
                    title: Text(theme),
                    trailing: selectedTheme == theme
                        ? const Icon(Icons.check, color: Colors.black)
                        : null,
                    onTap: () {
                      setState(() {
                        selectedTheme = theme;
                      });
                    },
                  );
                }).toList(),
              ),
            );
          },
        );
      },
    );
  }

  void _showSecurityDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: const Text('Security settings'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: ['Key', 'njjndjcc'].map((String security) {
                  return ListTile(
                    title: Text(security),
                    trailing: selectedSecurity == security
                        ? const Icon(Icons.check, color: Colors.black)
                        : null,
                    onTap: () {
                      setState(() {
                        selectedSecurity = security;
                      });
                    },
                  );
                }).toList(),
              ),
            );
          },
        );
      },
    );
  }

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
              Navigator.pop(context);
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
              const SizedBox(height: 30),
              _buildClickableContainer(
                  context, screenWidth, 'Язык', _showLanguageDialog),
              const SizedBox(height: 10),
              _buildClickableContainer(
                  context, screenWidth, 'Тема', _showThemeDialog),
              const SizedBox(height: 10),
              _buildClickableContainer(
                  context, screenWidth, 'Безопасность', _showSecurityDialog),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClickableContainer(BuildContext context, double screenWidth,
      String title, void Function(BuildContext) onTap) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Container(
        width: screenWidth * 0.9,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 239, 235, 235),
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: BuildCustomText(
                text: title,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.black,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
