import 'package:flutter/material.dart';
import 'konstants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String input = 'number + number', result = 'number';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        toolbarHeight: 0,
      ),
      backgroundColor: Color(0xFF1B3249),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            height: 25 * (deviceHeight(context) / 100),
            width: double.infinity,
            color: Colors.amber,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey.withOpacity(0.3),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 80,
                        offset: Offset.zero,
                      )
                    ],
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    input,
                    style: GoogleFonts.nunito(
                      color: Color(0xFFF9F9F9),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      result,
                      style: GoogleFonts.nunito(
                        fontSize: 50,
                        color: Color(0xFF1B3249),
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        icon: Icon(
                          Icons.clear,
                          size: 15,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            result = '';
                            input = '';
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //* Top Section End

          Container(
            margin: EdgeInsets.only(
              top: 1 * (deviceHeight(context) / 100),
            ),
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 4 * (deviceWidth(context) / 100),
                    right: 4 * (deviceWidth(context) / 100),
                    top: 2 * (deviceWidth(context) / 100),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[300]!.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                        ),
                        onPressed: () {
                          setState(() {
                            input = input + ' + ';
                          });
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.grey[300],
                          size: 30,
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                        ),
                        onPressed: () {
                          setState(() {
                            input = input + ' - ';
                          });
                        },
                        child: Icon(
                          Icons.remove,
                          color: Colors.grey[300],
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                        ),
                        onPressed: () {
                          setState(() {
                            input = input + ' x ';
                          });
                        },
                        child: Icon(
                          Icons.clear,
                          color: Colors.grey[300],
                          size: 30,
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                        ),
                        onPressed: () {
                          setState(() {
                            input = input + ' ÷ ';
                          });
                        },
                        child: Text(
                          '÷',
                          style: GoogleFonts.nunito(
                            fontSize: 45,
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      String finalResult = input;
                      finalResult = finalResult.replaceAll('x', '*');
                      Parser p = Parser();
                      Expression exp = p.parse(finalResult);
                      ContextModel cm = ContextModel();
                      double eval = exp.evaluate(EvaluationType.REAL, cm);
                      result = eval.toString();
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 39 * (deviceWidth(context) / 100),
                    ),
                    padding: EdgeInsets.only(
                      left: 23,
                      right: 23,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      '=',
                      style: GoogleFonts.nunito(
                        fontSize: 70,
                        color: Color(0xFF1B3249),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //*Middle Section End
          Container(
            margin: EdgeInsets.only(
              top: 3 * (deviceHeight(context) / 100),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          input = input + '7';
                        });
                      },
                      child: Text(
                        '7',
                        style: GoogleFonts.nunito(
                          color: Colors.grey[300],
                          fontSize: 65,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          input = input + '8';
                        });
                      },
                      child: Text(
                        '8',
                        style: GoogleFonts.nunito(
                          color: Colors.grey[300],
                          fontSize: 65,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          input = input + '9';
                        });
                      },
                      child: Text(
                        '9',
                        style: GoogleFonts.nunito(
                          color: Colors.grey[300],
                          fontSize: 65,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          input = input + '4';
                        });
                      },
                      child: Text(
                        '4',
                        style: GoogleFonts.nunito(
                          color: Colors.grey[300],
                          fontSize: 65,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          input = input + '5';
                        });
                      },
                      child: Text(
                        '5',
                        style: GoogleFonts.nunito(
                          color: Colors.grey[300],
                          fontSize: 65,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          input = input + '6';
                        });
                      },
                      child: Text(
                        '6',
                        style: GoogleFonts.nunito(
                          color: Colors.grey[300],
                          fontSize: 65,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          input = input + '1';
                        });
                      },
                      child: Text(
                        '1',
                        style: GoogleFonts.nunito(
                          color: Colors.grey[300],
                          fontSize: 65,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          input = input + '2';
                        });
                      },
                      child: Text(
                        '2',
                        style: GoogleFonts.nunito(
                          color: Colors.grey[300],
                          fontSize: 65,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          input = input + '3';
                        });
                      },
                      child: Text(
                        '3',
                        style: GoogleFonts.nunito(
                          color: Colors.grey[300],
                          fontSize: 65,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          input = input + '.';
                        });
                      },
                      child: Text(
                        '.',
                        style: GoogleFonts.nunito(
                          color: Colors.grey[300],
                          fontSize: 65,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          input = input + '0';
                        });
                      },
                      child: Text(
                        '0',
                        style: GoogleFonts.nunito(
                          color: Colors.grey[300],
                          fontSize: 65,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          input = input.substring(0, input.length - 1);
                        });
                      },
                      child: Icon(
                        Icons.backspace_outlined,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
