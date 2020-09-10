import 'package:amex_growthhack/utilities/api.dart';
import 'package:amex_growthhack/utilities/constants.dart';
import 'package:amex_growthhack/widgets/forms/base_form.dart';
import 'package:flutter/material.dart';

class CustomerOnboardingScreen extends StatefulWidget {

  CustomerOnboardingScreen({ Key key }): super(key: key);

  @override
  _CustomerOnboardingScreenState createState() => _CustomerOnboardingScreenState();
}

class _CustomerOnboardingScreenState extends State<CustomerOnboardingScreen> {

  final Map<String, bool> socialCauses = SOCIAL_CAUSES;
  final TextEditingController controller = TextEditingController();

  getSubmittedValues() {
    List<String> causes = [];
    socialCauses.forEach((key, value) { if (value) causes.add(key); });
    return causes;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Onboarding Menu'),
        backgroundColor: const Color(0xFF031956),
      ),
      body: Builder(
        builder: (BuildContext innerContext) {
          return ListView(
            children: [
              BaseFormField(this.controller, ZIP_CODE_FIELD, '', 15).build(context),
              Column(
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
              RaisedButton(
                color: const Color(0xFF2671B9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () async {
                  print(getSubmittedValues());
                  await postCustomerSocialValues({
                    'social_values': getSubmittedValues(),
                    'location': {
                      'postal_code': this.controller.text,
                    }
                  });
                  final snackbar = SnackBar(
                      content: Text(SUCCESS_CUSTOMER_ADD),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.blue[500]
                  );
                  Scaffold.of(innerContext).showSnackBar(snackbar);
                  await Future.delayed(Duration(seconds: 2));
                  Navigator.pushNamed(innerContext, '/');
                },
                child: Container(
                  child: Text(SUBMIT_MERCHANT,
                      style: TextStyle(color: Colors.white)
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}