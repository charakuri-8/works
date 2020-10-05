import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:works/view/choice_model.dart';

class ChoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChoiceModel>(
          create: (_) => ChoiceModel(),
        ),
      ],
      child: Scaffold(
        body: Consumer<ChoiceModel>(
          builder: (context, model, child) {
            return Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('ログイン'),
                    SizedBox(height: 30.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                        ),
                        RaisedButton(onPressed: null),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
