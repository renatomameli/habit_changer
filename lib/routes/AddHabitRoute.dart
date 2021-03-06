import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_changer/model/build/HabitBuild.dart';
import 'package:habit_changer/routes/AddHabitObviousRoute.dart';
import 'package:habit_changer/utils/Constants.dart';
import 'package:habit_changer/widgets/PaddingStandard.dart';

class AddHabitRoute extends StatelessWidget {
  const AddHabitRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: const Text('New Habit'),
                backgroundColor: Constants.appBarColor,
                leading: BackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
            body: SingleChildScrollView(child: const _MyStatefulWidget())));
  }
}

class _MyStatefulWidget extends StatefulWidget {
  const _MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<_MyStatefulWidget> createState() => _MyForm();
}

class _MyForm extends State<_MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late HabitBuild habitBuild = new HabitBuild();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PaddingStandard(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Habit Name',
              ),
              validator: (String? value) {
                if ((value == null || value.isEmpty)) {
                  return 'Please enter some text';
                }
                habitBuild.setName(value);
                return null;
              },
            ),
          ),
          PaddingStandard(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Question',
              ),
              validator: (String? value) {
                if ((value == null || value.isEmpty)) {
                  return 'Please enter some text';
                }
                habitBuild.setQuestion(value);
                return null;
              },
            ),
          ),
          PaddingStandard(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Notes (optional)',
              ),
              validator: (String? value) {
                habitBuild.setNotes(value!);
                return null;
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentContext;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddHabitObviousRoute(
                              habitBuild: habitBuild)));
                }
              },
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}
