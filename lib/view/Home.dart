import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int index = 0;
  PageController controller = PageController();
  var wtController = TextEditingController();
  var inController = TextEditingController();
  var ftController = TextEditingController();
  var result = "";
  String selectedGender = 'male';
  var bgColor;

  // Function to show the dialog box
  void _showResultDialog(BuildContext context, String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: bgColor,
          title: const Center(child: Text("BMI Result")),
          content: Text(result),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            setState(() {
              index = value;
            });
          },
          children: [
            // First Page (Intro Page)
            Container(
              height: height,
              width: width,
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: height * 0.1),
                  Text(
                    "BMI",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: width * 0.23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Calculator",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: width * 0.07,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  Container(
                    height: height * 0.2,
                    width: width * 0.5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("images/bmi.png"),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.15),
                  InkWell(
                    onTap: () {
                      controller.jumpToPage(1);
                    },
                    child: Container(
                      height: height * 0.06,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Start",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.07,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Second Page (BMI Input Page)
            Scaffold(
              body: Container(
                height: height,
                width: width,
                color: Colors.white,
                child: Center(
                  child: SizedBox(
                    width: width * 0.82,
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.08),
                        Text(
                          "BMI",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: width * 0.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Calculator",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: width * 0.07,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: height * 0.06),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: SizedBox(
                            height: height * 0.06,
                            width: width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: height * 0.06,
                                  width: width * 0.45,
                                  child: Center(
                                    child: Text(
                                      "Select Gender",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: width * 0.05,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.06,
                                  width: width * 0.35,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedGender = 'female';
                                          });
                                        },
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: SizedBox(
                                            height: height * 0.05,
                                            width: width * 0.15,
                                            child: Icon(
                                              Icons.female,
                                              size: width * 0.09,
                                              color: selectedGender == 'female'
                                                  ? Colors.pink
                                                  : Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedGender = 'male';
                                          });
                                        },
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: SizedBox(
                                            height: height * 0.05,
                                            width: width * 0.15,
                                            child: Icon(
                                              Icons.male,
                                              size: width * 0.09,
                                              color: selectedGender == 'male'
                                                  ? Colors.blue
                                                  : Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.04),
                        TextField(
                          controller: wtController,
                          decoration: const InputDecoration(
                              label: Text("Enter your weight (in Kgs)"),
                              prefixIcon: Icon(Icons.line_weight)),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: height * 0.02),
                        TextField(
                          controller: ftController,
                          decoration: const InputDecoration(
                              label: Text("Enter your Height (in Feet)"),
                              prefixIcon: Icon(Icons.height)),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: height * 0.02),
                        TextField(
                          controller: inController,
                          decoration: const InputDecoration(
                              label: Text("Enter your Height (in inch)"),
                              prefixIcon: Icon(Icons.height)),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: height * 0.06),
                        InkWell(
                          onTap: () {
                            var wt = wtController.text.toString();
                            var ft = ftController.text.toString();
                            var inch = inController.text.toString();

                            if (wt.isNotEmpty &&
                                ft.isNotEmpty &&
                                inch.isNotEmpty) {
                              var iwt = int.parse(wt);
                              var ift = int.parse(ft);
                              var iInch = int.parse(inch);

                              var tInch =
                                  (ift * 12) + iInch; // Total height in inches
                              var tCm = tInch * 2.54; // Convert height to cm
                              var tM = tCm / 100; // Convert height to meters

                              var bmi = iwt / (tM * tM); // Calculate BMI
                              var msg = "";

                              // Gender-specific classification
                              if (selectedGender == 'male') {
                                if (bmi > 25) {
                                  msg = "You're Overweight!!";
                                  bgColor = Colors.orange.shade200;
                                } else if (bmi < 18) {
                                  msg = "You're Underweight!!";
                                  bgColor = Colors.red.shade200;
                                } else {
                                  msg = "You're Healthy!!";
                                  bgColor = Colors.green.shade200;
                                }
                              } else if (selectedGender == 'female') {
                                if (bmi > 24) {
                                  // Adjust the threshold for female
                                  msg = "You're Overweight!!";
                                  bgColor = Colors.orange.shade200;
                                } else if (bmi < 17) {
                                  msg = "You're Underweight!!";
                                  bgColor = Colors.red.shade200;
                                } else {
                                  msg = "You're Healthy!!";
                                  bgColor = Colors.green.shade200;
                                }
                              }

                              result =
                                  "Your BMI is: ${bmi.toStringAsFixed(2)}\n$msg";

                              _showResultDialog(context, result);

                              // Clear the text fields
                              wtController.clear();
                              ftController.clear();
                              inController.clear();
                            } else {
                              setState(() {
                                result = "Please fill all the required fields!";
                                bgColor = Colors.white;
                              });
                              _showResultDialog(context, result);
                            }
                          },
                          child: Container(
                            height: height * 0.06,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Calculate",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
