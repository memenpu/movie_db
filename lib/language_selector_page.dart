import 'package:flutter/material.dart';

import 'app_transilations.dart';
import 'application.dart';

class LanguageSelectorPage extends StatefulWidget {
  @override
  _LanguageSelectorPageState createState() => _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends State<LanguageSelectorPage> {
//  languagesList also moved to the Application class just like the languageCodesList
  static final List<String> languagesList = application.supportedLanguages;
  static final List<String> languageCodesList = application.supportedLanguagesCodes;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
    languagesList[2]: languageCodesList[2],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
//            "Select language"
            AppTranslations.of(context).text("title_select_language"),
        ),
      ),
      body: _buildLanguagesList(),
    );
  }

  _buildLanguagesList() {
    return ListView.builder(
      itemCount: languagesList.length,
      itemBuilder: (context, index){
        return _buildLanguageItem(languagesList[index]);
      },
    );
  }

  _buildLanguageItem(String language){
    return InkWell(
      onTap: () {
        print(language);
        application.onLocaleChanged(Locale(languagesMap[language]));

      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            language,
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}