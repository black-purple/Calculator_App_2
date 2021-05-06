import 'package:flutter/material.dart';
import 'konstants.dart';
import 'package:google_fonts/google_fonts.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String input = '200 + 100', result = '42';
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
            height: 20 * (deviceHeight(context) / 100),
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
                    style: TextStyle(
                      color: Color(0xFFF9F9F9),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        result,
                        style:
                            TextStyle(fontSize: 50, color: Color(0xFF1B3249)),
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
          SizedBox(
            height: 1 * (deviceHeight(context) / 100),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.grey[300],
                    size: 30,
                  ),
                ),
                //* Equals Button
                GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      '=',
                      style: GoogleFonts.nunito(
                        fontSize: 60,
                        color: Color(0xFF1B3249),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
