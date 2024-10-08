import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:path/path.dart' as Path;
import 'Result.dart';

class BloodworkForm extends StatefulWidget {
  @override
  _BloodworkFormState createState() => _BloodworkFormState();
}

class _BloodworkFormState extends State<BloodworkForm> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 102, 196, 1),
          elevation: 0.0,
        ),
        body: Container(
          color: const Color(0xFFF6F8FC),
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: TopContainer(),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                flex: 7,
                child: BottomContainer(),
              ),
            ],
          ),
        ));
  }
}

class TopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.elliptical(50, 27),
            bottomRight: Radius.elliptical(50, 27),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.grey.shade400,
              offset: const Offset(0, 3.5),
            )
          ],
          color: const Color.fromRGBO(255, 102, 196, 1),
        ),
        width: double.infinity,
        child: const Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: 5,
            ),
            child: Text(
              "Blood Test",
              style: TextStyle(
                fontFamily: "Pacifico",
                fontSize: 35,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Center(
              child: Text(
                "This section will help you to determine whether you have hypothyroidism, hyperthyroidism, or euthyroidism. "
                "\nKindly fill out all the the input fields in order to see the result.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontFamily: "Urbanist",
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ]));
  }
}

class BottomContainer extends StatefulWidget {
  @override
  _BottomContainerState createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  double? TSH, T3, TT4, T4U, FTI;
  validform() {
    if (TSH != null &&
        T3 != null &&
        TT4 != null &&
        T4U != null &&
        FTI != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 30, top: 20, right: 30),
            child: Form(
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Column(children: <Widget>[
                  PanelTitle(
                    title: "Add TSH",
                    isRequired: true,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Enter the value of TSH (mu/L)',
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5))),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          TSH = double.parse(value);
                        });
                      }
                    },
                    onSubmitted: (value) {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  PanelTitle(
                    title: "Add T3",
                    isRequired: true,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Enter the value of T3 (pmol/L)',
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5))),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          T3 = double.parse(value);
                        });
                      }
                    },
                    onSubmitted: (value) {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  PanelTitle(
                    title: "Add TT4",
                    isRequired: true,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Enter the value of TT4 (nmol/L)',
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5))),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          TT4 = double.parse(value);
                        });
                      }
                    },
                    onSubmitted: (value) {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  PanelTitle(
                    title: "Add T4U",
                    isRequired: true,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Enter the value of T4U (nmol/L)',
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5))),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          T4U = double.parse(value);
                        });
                      }
                    },
                    onSubmitted: (value) {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  PanelTitle(
                    title: "Add FTI",
                    isRequired: true,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Enter the value of FTI (μg/dL)',
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5))),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          FTI = double.parse(value);
                        });
                      }
                    },
                    onSubmitted: (value) {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    MaterialButton(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0))),
                        elevation: 5.0,
                        color: const Color.fromRGBO(255, 102, 196, 1),
                        height: MediaQuery.of(context).size.height * 0.07,
                        onPressed: () async {
                          {
                            if (validform()) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Result(
                                            TSH: TSH,
                                            T3: T3,
                                            TT4: TT4,
                                            T4U: T4U,
                                            FTI: FTI,
                                          )));
                            } else {
                              Alert(
                                  context: context,
                                  title: 'All fields are required',
                                  buttons: [],
                                  style: const AlertStyle(
                                    backgroundColor: Colors.white,
                                  )).show();
                            }
                          }
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.height * 0.22,
                          alignment: Alignment.center,
                          child: const Text("PREDICT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ))
                  ]),
                  const SizedBox(
                    height: 40.0,
                  ),
                ]),
              )
            ])))));
  }
}

class PanelTitle extends StatelessWidget {
  final String title;
  final bool isRequired;
  PanelTitle({
    Key? key,
    required this.title,
    required this.isRequired,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 240),
      child: Text.rich(
        TextSpan(children: <TextSpan>[
          TextSpan(
            text: title,
            style: const TextStyle(
                fontFamily: 'Urbanist', fontSize: 20, color: Colors.black87),
          ),
          TextSpan(
            text: isRequired ? " *" : "",
            style: const TextStyle(fontSize: 14, color: Colors.red),
          ),
        ]),
      ),
    );
  }
}
