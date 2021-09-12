import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_components/utils/formatter.dart';


class CustomForm extends StatefulWidget {

  static const List<String> _kOptions = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {

  var items = ['Working a lot harder', 'Being a lot smarter', 'Being a self-starter', 'Placed in charge of trading charter'];
  bool isFilled = true;

  autoSuggest(String value){
    items = items.map((item)=>item.toUpperCase()).toList();
    print(value);

    for (int i = 0; i < items.length; i++) {
      String data = items[i];
      if (data.toLowerCase().contains(value.toLowerCase())) {
        print('sonuc $data');
      } else {
        // print('tum liste $data');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Form'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.80,
          width: MediaQuery.of(context).size.width * 0.90,
          decoration: BoxDecoration(
            border: Border.all(
              // color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: new Row(
                  children: <Widget>[
                    Expanded(
                      child: Autocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          // return onSelectedController(textEditingValue.text);
                          items = items.map((item)=>item.toUpperCase()).toList();


                          return items.where((String option) {
                            return option
                                .contains(textEditingValue.text.toUpperCase());
                          });
                        },
                        onSelected: (test) {
                        },
                      )

                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onTap: (){
                          // String test = '';
                          // autoSuggest(test);
                        },
                        onChanged: (value) {
                          setState(() {
                            autoSuggest(value);

                          });

                        },

                      ),
                    ),
                    IconButton(onPressed: (){
                      String value = '';
                      autoSuggest(value);
                    }, icon: Icon(Icons.arrow_drop_down))



                      // (Icons.arrow_drop_down)),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
