import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  
  String? _autocompleteSelection;


  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }






  var items = [
    'Working a lot harder',
    'Being a lot smarter',
    'Being a self-starter',
    'Placed in charge of trading charter'
  ];

  static const List<String> _options = <String>[
    'aardvark',
    'bobcat',
    'chameleon',
  ];
  bool isFilled = true;

  autoSuggest(String value) {
    items = items.map((item) => item.toUpperCase()).toList();
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
  
  autoSuggestController() {
    
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
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: new Row(
                  children: <Widget>[
                    Expanded(
                        child: Autocomplete<String>(
                          key: Key('val'),
                      optionsBuilder: (TextEditingValue textEditingValue) {


                        print('focus is active');


                        // return onSelectedController(textEditingValue.text);
                        items = items.map((item) => item.toUpperCase()).toList();
    
                        return items.where((String option) {
                          return option
                              .contains(textEditingValue.text.toUpperCase());
                        });
                      },
                      onSelected: autoSuggest,
                    ),
                    ),
                    IconButton(onPressed: () {
                     // FocusScope.of(context).requestFocus(_focusNode);
                     myFocusNode.requestFocus();
                     //  FocusScope.of(context).previousFocus();

                    },
                    icon: Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: RawAutocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          return _options.where((String option) {
                            return option.contains(textEditingValue.text.toLowerCase());
                          });
                        },
                        fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                          return TextFormField(controller: textEditingController, focusNode: myFocusNode, onFieldSubmitted: (String value) {
                              onFieldSubmitted();
                            },
                          );
                        },
                        optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Material(
                              elevation: 4.0,
                              child: SizedBox(
                                height: 200.0,
                                child: ListView.builder(
                                  padding: const EdgeInsets.all(8.0),
                                  itemCount: options.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final String option = options.elementAt(index);
                                    return GestureDetector(
                                      onTap: () {
                                        onSelected(option);
                                      },
                                      child: ListTile(
                                        title: Text(option),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    IconButton(onPressed: () {
                      // FocusScope.of(context).requestFocus(myFocusNode);
                      // myFocusNode.requestFocus();
                      //  FocusScope.of(context).previousFocus();
                      myFocusNode.requestFocus();

                    },
                      icon: Icon(Icons.arrow_drop_down),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: RawAutocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          return _options.where((String option) {
                            return option.contains(textEditingValue.text.toLowerCase());
                          });
                        },
                        onSelected: (String selection) {
                          setState(() {
                            _autocompleteSelection = selection;
                          });
                        },
                        fieldViewBuilder: (BuildContext context,
                            TextEditingController textEditingController,
                            FocusNode focusNode,
                            VoidCallback onFieldSubmitted) {
                          return TextFormField(
                            controller: textEditingController,
                            decoration: const InputDecoration(
                              hintText: 'This is a RawAutocomplete!',
                            ),
                            focusNode: focusNode,
                            onFieldSubmitted: (String value) {
                              onFieldSubmitted();
                            },
                            validator: (String? value) {
                              if (!_options.contains(value)) {
                                return 'Nothing selected.';
                              }
                              return null;
                            },
                          );
                        },
                        optionsViewBuilder: (BuildContext context,
                            AutocompleteOnSelected<String> onSelected,
                            Iterable<String> options) {
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Material(
                              elevation: 4.0,
                              child: SizedBox(
                                height: 200.0,
                                child: ListView.builder(
                                  padding: const EdgeInsets.all(8.0),
                                  itemCount: options.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final String option = options.elementAt(index);
                                    return GestureDetector(
                                      onTap: () {
                                        onSelected(option);
                                      },
                                      child: ListTile(
                                        title: Text(option),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    IconButton(onPressed: () {
                      // FocusScope.of(context).requestFocus(myFocusNode);
                      // myFocusNode.requestFocus();
                      //  FocusScope.of(context).previousFocus();
                      myFocusNode.requestFocus();

                    },
                      icon: Icon(Icons.arrow_drop_down),
                    ),

                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(24.0),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: TextField(
              //           onTap: () {
              //             // String test = '';
              //             // autoSuggest(test);
              //           },
              //           onChanged: (value) {
              //             setState(() {
              //               autoSuggest(value);
              //             });
              //           },
              //         ),
              //       ),
              //       IconButton(
              //           onPressed: () {
              //             String value = '';
              //             autoSuggest(value);
              //           },
              //           icon: Icon(Icons.arrow_drop_down)),
              //     ],
              //   ),
              // ),
              // Container(
              //   width: 400,
              //   height: 200,
              //  
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Colors.grey
              //     ),
              //   ),
              //   child: ListView.builder(
              //    
              //       itemCount: items.length,
              //       itemBuilder: (BuildContext context, int index) {
              //        
              //         return PopupMenuItem(
              //             child: Text('${items[index]}'),
              //          
              //         );
              //       }
              //   ),
              // ),
              // Container(
              //   width: 600,
              //   height: 50,
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Colors.grey
              //     ),
              //   ),
              //   child: PopupMenuButton<String>(
              //     itemBuilder: (BuildContext context) {
              //       return items.map<PopupMenuItem<String>>((String value) {
              //         return PopupMenuItem(
              //             value: value,
              //             child: Container(
              //               width: 1000,
              //               color: Colors.red,
              //                 child: Text(value),
              //             ), 
              //         );
              //       }).toList();
              //     },
              //   ),
              // ),
              // PopupMenuButton<String>(
              //   itemBuilder: (BuildContext context) {
              //     return items.map<PopupMenuItem<String>>((String value) {
              //       return new PopupMenuItem(
              //           child: new Text(value), value: value);
              //     }).toList();
              //   },
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(24.0),
              //   child: new Row(
              //     children: <Widget>[
              //       new Expanded(child: new TextField(controller: _controller)),
              //       new PopupMenuButton<String>(
              //         icon: const Icon(Icons.arrow_drop_down),
              //         onSelected: (String value) {
              //           _controller.text = value;
              //         },
              //         itemBuilder: (BuildContext context) {
              //           return items.map<PopupMenuItem<String>>((String value) {
              //             return new PopupMenuItem(
              //                 child: new Text(value), value: value);
              //           }).toList();
              //         },
              //       ),
              //     ],
              //   ),
              // ),
        ]),
      )),
    );
    throw UnimplementedError();
  }
}
