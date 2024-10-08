import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thyroidclass/subpage/Bloodwork/BloodworkForm.dart';
import 'package:thyroidclass/subpage/Bloodwork/Loading.dart';
import 'package:http/http.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Result extends StatefulWidget {
  final TSH, T3, TT4, T4U, FTI;
  Result({this.TSH, this.T3, this.TT4, this.T4U, this.FTI});

  @override
  _BloodworkFormState createState() => _BloodworkFormState();
}

class _BloodworkFormState extends State<Result> {
  int? prediction;

  Future<void> predict() async {
    try {
      String url =
          'https://tyhro-backend-app.onrender.com/predict/?TSH=${widget.TSH}&T3=${widget.T3}&TT4=${widget.TT4}&T4U=${widget.T4U}&FTI=${widget.FTI}';
      Response data = await get(Uri.parse(url));
      setState(() {
        prediction = jsonDecode(data.body)['classes'];
      });
    } on FirebaseAuthException catch (e) {
      Alert(
              context: context,
              title: 'Error',
              desc: e.message,
              buttons: [],
              style: const AlertStyle(backgroundColor: Colors.cyan))
          .show();
    }
  }

  @override
  void initState() {
    predict();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (prediction == null) {
      return Loading();
    } else {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: const Color(0xFF1CC8A5),
            centerTitle: true,
            title: Image.asset(
              'assets/images/logo.png',
              height: 150,
            ),
            toolbarHeight: 70,
          ),
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
                child: Container(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text(
                          'Blood Test Result',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(255, 102, 196, 1),
                            fontFamily: "Pacifico",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Center(
                          child: LayoutBuilder(builder: (context, constraints) {
                        if ('$prediction' == '0') {
                          return Container(
                              child: Column(children: [
                            const Text(
                              "Hyperthyroidism",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            const Text(
                              "What is hyperthyroidism?",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height * 0.030),
                            const Text(
                                "   When your thyroid gland produces too much of the hormone thyroxine, you have hyperthyroidism (overactive thyroid). "
                                "Hyperthyroidism can cause your body's metabolism to speed up, resulting in unintentional weight loss and a rapid or irregular heartbeat.",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontFamily: 'Urbanist',
                                ),
                                textAlign: TextAlign.justify),
                            SizedBox(height: size.height * 0.03),
                            const Text(
                              "Symptoms",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            const Text(
                                "    Symptoms can appear gradually or suddenly. They can be mild for some people, but severe for others and significantly affect their life. "
                                "\n\n   Hyperthyroidism signs and symptoms may include: "
                                "\n\n   ⚫ Hyperactivity\n   ⚫ Nervousness, anxiety and irritability\n   ⚫ Mood swings\n   ⚫ Difficulty in sleeping\n   ⚫ Diarrhoea\n   ⚫ Feeling tired all the time\n   ⚫ Muscle weakness\n   ⚫ Itchiness \n   ⚫ Persistent thirst \n   ⚫ Needing to pee more often than usual \n   ⚫ Sensitivity to heat \n   ⚫ Loss of interest in sex",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontFamily: 'Urbanist',
                                ),
                                textAlign: TextAlign.justify),
                            SizedBox(height: size.height * 0.03),
                            const Text(
                              "Treatment",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            const Text(
                                "   There are several treatments available for hyperthyroidism. To reduce thyroid hormone production, doctors use anti-thyroid medications and radioactive iodine. Surgery to remove all or part of your thyroid gland is sometimes used to treat hyperthyroidism.",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontFamily: 'Urbanist',
                                ),
                                textAlign: TextAlign.justify),
                          ]));
                        } else if ('$prediction' == '1') {
                          return Container(
                              child: Column(children: [
                            const Text(
                              "Hypothyroidism",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            const Text(
                              "What is hypothyroidism?",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            const Text(
                                "   Hypothyroidism is a common condition in which the thyroid produces and releases insufficient thyroid hormone into the bloodstream. This causes your metabolism to slow. Hypothyroidism, also known as underactive thyroid, can cause fatigue, weight gain, and an inability to tolerate cold temperatures. Hormone replacement therapy is the primary treatment for hypothyroidism.",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontFamily: 'Urbanist',
                                ),
                                textAlign: TextAlign.justify),
                            SizedBox(height: size.height * 0.03),
                            const Text(
                              "Symptoms",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            const Text(
                                "   The signs and symptoms of hypothyroidism differ depending on the severity of the hormone deficiency. Problems often emerge gradually, over time.At first, you may not notice the symptoms of hypothyroidism, such as fatigue and weight gain. You could also simply attribute them to getting older. However, as your metabolism slows, you may develop more obvious problems. "
                                "\n\n   Hypothyroidism signs and symptoms may include: "
                                "\n\n   ⚫ Fatigue\n   ⚫ Constipation\n   ⚫ Dry skin\n   ⚫ Increased sensitivity to cold\n   ⚫ Puffy face\n   ⚫ Thinning hair\n   ⚫ Muscle aches, tenderness and stiffness \n   ⚫ Pain, stiffness or swelling in your joints \n  ⚫ Heavier than normal or irregular menstrual periods \n   ⚫ Impaired memory \n   ⚫ Enlarged thyroid gland (goiter) \n   ⚫ Slowed heart rate",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontFamily: 'Urbanist',
                                ),
                                textAlign: TextAlign.justify),
                            SizedBox(height: size.height * 0.03),
                            const Text(
                              "Treatment",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            const Text(
                                "   The synthetic thyroid hormone levothyroxine is used on a daily basis to treat hypothyroidism (Levo-T, Synthroid, others). This oral medication restores adequate hormone levels, reversing hypothyroidism's signs and symptoms. You should begin to feel better soon after beginning treatment.",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontFamily: 'Urbanist',
                                ),
                                textAlign: TextAlign.justify),
                          ]));
                        } else {
                          return Container(
                              child: Column(children: [
                            const Text("Euthyroidism",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(height: size.height * 0.03),
                            const Text(
                              "What is euthyroidism?",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            const Text(
                                "   A condition in which the thyroid gland is healthy and secretes properly sized and composed amounts of hormones. It is referred to as normal thyroid function when TSH and T4 levels in the serum are within normal ranges.",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontFamily: 'Urbanist',
                                ),
                                textAlign: TextAlign.justify),
                          ]));
                        }
                      })),
                      //child: Text(
                      //'$prediction',
                      // textAlign: TextAlign.center,
                      // style: TextStyle(
                      //   color: Colors.black,
                      //  fontSize: 40,
                      //  fontWeight: FontWeight.bold,
                      //  fontFamily: 'Urbanist',
                      // ),
                      // ),

                      SizedBox(height: size.height * 0.03),
                      const Text(
                          "   Disclaimer: This tool is not intended to replace professional medical advice, diagnosis, or treatment. Never disregard professional medical advice when seeking treatment based on something you read on the ThyroCare App.",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontFamily: 'Urbanist',
                            //fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.justify),
                      SizedBox(height: size.height * 0.03),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(255, 102, 196, 1),
                            padding: const EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Color.fromRGBO(255, 102, 196, 1),
                                  width: 5,
                                ),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          child: const Text(
                            'Test Again',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BloodworkForm(),
                                ));
                          }),
                    ],
                  ),
                ),
              ),
            ))
          ]));
    }
  }
}
