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
              new Padding(
                padding: const EdgeInsets.all(24.0),
                child: GestureDetector(
                  onTap: (){
                    print('tikladiniz');
                    setState(() {
                      isFilled = false;
                    });
                  },
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child:
                        isFilled ?
                        Autocomplete<String>(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            // return onSelectedController(textEditingValue.text);
                            items = items.map((item)=>item.toUpperCase()).toList();


                            if (textEditingValue.text == '') {
                              return const Iterable<String>.empty();
                            }
                            return items.where((String option) {
                              return option
                                  .contains(textEditingValue.text.toUpperCase());
                            });
                          },
                          onSelected: (test) {
                          },
                        )
                            :
                        Autocomplete<String>(
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
                      // new PopupMenuButton<String>(
                      //   icon: const Icon(Icons.arrow_drop_down),
                      //   onSelected: (String value) {
                      //     setState(() {
                      //
                      //       deneme = value;
                      //       onSelectedController(deneme!);
                      //       showAutoComplete = true;
                      //
                      //     });
                      //
                      //   },
                      //   itemBuilder: (BuildContext context) {
                      //     return items.map<PopupMenuItem<String>>((String value) {
                      //       return new PopupMenuItem(child: new Text(value), value: value);
                      //     }).toList();
                      //   },
                      // ),
                    ],
                  ),
                ),
              ),
              // customTextField(),
            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
