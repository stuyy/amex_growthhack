import 'package:amex_growthhack/api/api.dart';
import 'package:amex_growthhack/utilities/constants.dart';
import 'package:amex_growthhack/widgets/forms/base_form.dart';
import 'package:flutter/material.dart';

class MerchantForm extends StatefulWidget {

  @override
  _MerchantFormState createState() => _MerchantFormState();
}

class _MerchantFormState extends State<MerchantForm> {
  final _businessNameController = TextEditingController();
  final _communityDescriptionController = TextEditingController();
  final _originDescriptionController = TextEditingController();
  final _futureDescriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final Map<String, bool> socialCauses = {
    "Black Owned": false,
    "Woman Owned": false,
    "Veteran Owned": false,
    "LGBTQ Owned": false,
    "Hispanic Owned": false,
    "Asian Owned": false,
    "Disability Owned": false,
    "Formerly Incarcerated Owned": false,
    "Immigrant Owned": false,
    "Environmentally Conscious": false,
    "Fair Labor": false,
    "Animal Rights": false,
  };


  @override
  void initState() {
    super.initState();
    _businessNameController.addListener(businessNameChanged);
    _communityDescriptionController.addListener(communityDescriptionChanged);
    _originDescriptionController.addListener(originDescriptionChanged);
    _futureDescriptionController.addListener(futureDescriptionChanged);
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _communityDescriptionController.dispose();
    super.dispose();
  }

  businessNameChanged() {
    print(_businessNameController.text);
  }

  communityDescriptionChanged() {
    print(_communityDescriptionController.text);
  }

  originDescriptionChanged() {
    print(_originDescriptionController.text);
  }

  futureDescriptionChanged() {
    print(_futureDescriptionController.text);
  }

  Map<String, dynamic>getSubmittedValues() {
    List<String> causes = [];
    socialCauses.forEach((key, value) { if (value) causes.add(key); });
    return {
      'name': _businessNameController.text,
      'descriptions': {
        'community': _communityDescriptionController.text,
        'origin': _originDescriptionController.text,
        'future': _futureDescriptionController.text
      },
      'social_values': causes,
    };
  }

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: [
              BaseFormField(
                _businessNameController,
                BUSINESS_NAME_FIELD,
                CHARACTER_LIMIT_100,
                CHAR_LIMIT_100
              ).build(context),
              BaseFormField(
                _communityDescriptionController,
                COMMUNITY_FIELD,
                CHARACTER_LIMIT_500,
                CHAR_LIMIT_500
              ).build(context),
              BaseFormField(
                _originDescriptionController,
                ORIGIN_FIELD,
                CHARACTER_LIMIT_500,
                CHAR_LIMIT_500
              ).build(context),
              BaseFormField(
                _futureDescriptionController,
                FUTURE_FIELD,
                CHARACTER_LIMIT_500,
                CHAR_LIMIT_500
              ).build(context),
              Card(
                child: Column(
                  children: socialCauses.keys.map((t) => CheckboxListTile(
                    title: Text(t),
                    value: socialCauses[t],
                    onChanged: (bool val) => {
                      setState(() => {
                        socialCauses[t] = val
                      })
                    }
                  )).toList()
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]
                ),
                child: RaisedButton(
                  color: const Color(0xFF2671B9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      await handlePost(getSubmittedValues());
                    }
                  },
                  child: Container(
                    child: Text('Submit Details',
                        style: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}