import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        'request_page': (context) {
          return RequestPage();
        },
        'time_off_request_page': (context) {
          return DetailRequestPage('Time Off Request', 'Time Off Request Page');
        },
        'overtime_request_page': (context) {
          return DetailRequestPage('Overtime Request', 'Overtime Request Page');
        },
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final quickActions = QuickActions();

  @override
  Widget build(BuildContext context) {
    _initQuickActions(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Request'),
          onPressed: () {
            Navigator.pushNamed(context, 'request_page');
          },
        ),
      ),
    );
  }

  void _initQuickActions(BuildContext context) {
    quickActions.initialize((type) async {
      await Future.delayed(Duration(seconds: 1));
      if (type == 'time_off_request_page') {
        Navigator.pushNamed(context, 'time_off_request_page');
      } else if (type == 'overtime_request_page') {
        Navigator.pushNamed(context, 'overtime_request_page');
      }
    });
    quickActions.setShortcutItems(
      <ShortcutItem>[
        ShortcutItem(
          type: 'time_off_request_page',
          localizedTitle: 'Time Off Request',
          icon: Platform.isIOS ? 'IconTimeOffRequest' : 'ic_time_off_request',
        ),
        ShortcutItem(
          type: 'overtime_request_page',
          localizedTitle: 'Overtime Request',
          icon: Platform.isIOS ? 'IconOvertimeRequest' : 'ic_overtime_request',
        ),
      ],
    );
  }
}

class RequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requests'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Time Off Request'),
              onPressed: () {
                Navigator.pushNamed(context, 'time_off_request_page');
              },
            ),
            ElevatedButton(
              child: Text('Overtime Request'),
              onPressed: () {
                Navigator.pushNamed(context, 'overtime_request_page');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DetailRequestPage extends StatelessWidget {
  final String title;
  final String body;

  DetailRequestPage(this.title, this.body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(body),
      ),
    );
  }
}
