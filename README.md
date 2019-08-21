# Flutte Dymanic Theme
How to Implement Dynamic Theme in Flutter using Provider

# Introduction:
- In this Article we are going to discuss about how to implement dynamic theme in flutter using provider. There are many other ways to apply dynamic theme in flutter but I have found Provider as one of the best and most efficient ways to implement dynamic theme in flutter, so let’s begin our article.

## Summary of the Example:
- We will implement dynamic theme for control dark and light mode of the application which you have in some applications like reading application where light mode is for day and dark mode for night. You have also noticed that Google Maps have same feature for night and day mode which is automatically gets on and off according to the light.

## Output:
![Light Mode](https://raw.githubusercontent.com/myvsparth/flutter_dynamic_theme/master/screenshots/1.png)
![Dark Mode](https://raw.githubusercontent.com/myvsparth/flutter_dynamic_theme/master/screenshots/2.png)

    Required Plugin: provider

## Steps:
1. First and basic step to create new application in flutter. If you are a beginner in flutter then you can check my blog Create a first app in Flutter. I have created app named as “flutter_dynamic_theme”

2. Add provider plugin in pubspec.yaml file.
```
dependencies:
 flutter:
   sdk: flutter
 cupertino_icons: ^0.1.2
 provider: ^3.1.0
```

3. Create new file for theme provider implementation. I have created file named as theme_provider.dart. Following is the programming implementation.

```
// Package for ChangeNotifier class
import 'package:flutter/foundation.dart';
 
class DynamicTheme with ChangeNotifier {
 // ChangeNotifier : will provide a notifier for any changes in the value to all it's listeners
 bool isDarkMode = false;
 getDarkMode() => this.isDarkMode;
 void changeDarkMode(isDarkMode) {
   this.isDarkMode = isDarkMode;
   notifyListeners(); // Notify all it's listeners about update. If you comment this line then you will see that new added items will not be reflected in the list.
 }
}
```

4. Now, open main.dart file and implement change notifier for the whole app so we can change the theme from any point of the app. I have implemented switch to toggle dark and light mode of the theme. Following is the programming implementation.

```
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
```

5. Run the project in device and test the app. You can customize the theme as per your requirement.

## Conclusion:
-   In this article we have learned how to implement dynamic theme in flutter using provider. This example is basic and easy to understand and you can make it fully customizable by implementing other theme properties in provider file. You can also store the theme settings in shared preferences to keep setting active after closing and reopening the app.

Git Repo: https://github.com/myvsparth/flutter_dynamic_theme

## Related to Tags: Flutter, Dynamic Theme, Provider, Android, iOS

