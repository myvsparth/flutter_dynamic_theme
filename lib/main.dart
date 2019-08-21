import 'package:flutter/material.dart';
import 'package:flutter_dynamic_theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider<DynamicTheme>(
        builder: (_) => DynamicTheme(),
        child: MyHomePage(),
      ),
    );

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DynamicTheme>(context);
    return MaterialApp(
      theme: themeProvider.getDarkMode() ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(themeProvider.getDarkMode()?'Dark Mode':'Light Mode'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Enable Dark Mode'),
              Switch(
                value: themeProvider.getDarkMode(),
                onChanged: (value) {
                  setState(() {
                    themeProvider.changeDarkMode(value);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}