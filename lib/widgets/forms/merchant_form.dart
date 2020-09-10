import 'package:amex_growthhack/utilities/api.dart';
import 'package:amex_growthhack/utilities/constants.dart';
import 'package:amex_growthhack/widgets/forms/base_form.dart';
import 'package:flutter/material.dart';

class MerchantForm extends StatefulWidget {

  @override
  _MerchantFormState createState() => _MerchantFormState();
}

class _MerchantFormState extends State<MerchantForm> {
  final _formKey = GlobalKey<FormState>();
  final _businessNameController = TextEditingController();
  final _communityDescriptionController = TextEditingController();
  final _originDescriptionController = TextEditingController();
  final _futureDescriptionController = TextEditingController();

  final Map<String, bool> socialCauses = SOCIAL_CAUSES;

  @override
  void initState() {
    super.initState();
    _businessNameController.addListener(businessNameChanged);
    _communityDescriptionController.addListener(communityDescriptionChanged);
    _originDescriptionController.addListener(originDescriptionChanged);
    _futureDescriptionController.addListener(futureDescriptionChanged);

    handlePost({
      'name': 'SHAKTIBARRE',
      'descriptions': {
        'community': 'SHAKTIBARRE',
        'origin': 'SHAKTIBARRE',
        'future': 'SHAKTIBARRE'
      },
      'social_values': ['Immigrant Owned', 'Black Owned', 'Veteran Owned'],
      'location': {
        'address': '449 Keap St',
        'city': 'Brooklyn',
        'state': 'New York',
        'postal': '11211',
      }
    });

    handlePost({
      'name': 'CITY VIEW LIVING',
      'descriptions': {
        'community': 'Amazon Web',
        'origin': 'Amazon Web',
        'future': 'Amazon Web'
      },
      'social_values': ['Immigrant Owned', 'Black Owned', 'Veteran Owned'],
      'location': {
        'address': '156 Hope St',
        'city': 'Brooklyn',
        'state': 'New York',
        'postal': '11211',
      }
    });

    handlePost({
      'name': "LUKE'S LOBSTER - LAB",
      'descriptions': {
        'community': 'Amazon Web',
        'origin': 'Amazon Web',
        'future': 'Amazon Web'
      },
      'social_values': ['Immigrant Owned', 'Black Owned', 'Veteran Owned'],
      'location': {
        'address': '242 E 81st St',
        'city': 'Manhattan',
        'state': 'New York',
        'postal': '10028',
      }
    });

    handlePost({
      'name': "Hana Food Retail",
      'descriptions': {
        'community': 'Hana Food Retail',
        'origin': 'Hana Food Retail',
        'future': 'Hana Food Retail'
      },
      'social_values': ['Immigrant Owned', 'Black Owned', 'Veteran Owned'],
      'location': {
        'address': '242 E 81st St',
        'city': 'Manhattan',
        'state': 'New York',
        'postal': '10028',
      }
    });
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _communityDescriptionController.dispose();
    _originDescriptionController.dispose();
    _futureDescriptionController.dispose();
    super.dispose();
  }

  businessNameChanged() {
    //print(_businessNameController.text);
  }

  communityDescriptionChanged() {
    //print(_communityDescriptionController.text);
  }

  originDescriptionChanged() {
    //print(_originDescriptionController.text);
  }

  futureDescriptionChanged() {
    //print(_futureDescriptionController.text);
  }

  Map<String, dynamic>getSubmittedValues() {
    List<String> causes = [];
    socialCauses.forEach((key, value) { if (value) causes.add(key); });
    return {
      'name': _businessNameController.text.toLowerCase(),
      'descriptions': {
        'community': _communityDescriptionController.text,
        'origin': _originDescriptionController.text,
        'future': _futureDescriptionController.text
      },
      'social_values': causes,
    };
  }

  void resetForm() {
    _futureDescriptionController.clear();
    _originDescriptionController.clear();
    _communityDescriptionController.clear();
    _businessNameController.clear();

    socialCauses.forEach((key, value) {
      setState(() {
        socialCauses[key] = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      final snackbar = SnackBar(
                        content: Text(SUCCESS_MESSAGE),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.blue[500]
                      );
                      Scaffold.of(context).showSnackBar(snackbar);
                      this.resetForm();
                    }
                  },
                  child: Container(
                    child: Text(SUBMIT_MERCHANT,
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