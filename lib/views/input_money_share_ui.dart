// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_share_app/views/show_money_share_ui.dart';

class InputMoneyShareUI extends StatefulWidget {
  const InputMoneyShareUI({super.key});

  @override
  State<InputMoneyShareUI> createState() => _InputMoneyShareUIState();
}

class _InputMoneyShareUIState extends State<InputMoneyShareUI> {
  TextEditingController moneyCtrl = TextEditingController(text: '');
  TextEditingController personCtrl = TextEditingController(text: '');
  TextEditingController tipCtrl = TextEditingController(text: '');
  bool tipCheck = false; //สร้างตัวแปรคุม checkbox
  _showWarningDialog(context, msg) async {
    //สร้างตัวแปร กล่องแจ้งเตือน
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Color.fromARGB(255, 224, 79, 95),
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: GoogleFonts.itim(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
            textAlign: TextAlign.center,
            style: GoogleFonts.itim(
              color: Color.fromARGB(255, 224, 79, 95),
              fontSize: MediaQuery.of(context).size.width * 0.05,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 224, 79, 95),
                  ),
                  child: Text(
                    'ตกลง',
                    style: GoogleFonts.itim(),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  } //สร้างตัวแปร กล่องแจ้งเตือน

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 140, 172),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 235, 69, 57),
          title: Text(
            'แชร์เงินกันเถอะ',
            style: GoogleFonts.itim(
              fontSize: MediaQuery.of(context).size.width * 0.06,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Image.asset(
                  'assets/images/Money.png',
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    controller: moneyCtrl,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.itim(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 146, 9, 55),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 206, 54, 54),
                        ),
                      ),
                      hintText: 'ป้อนจำนวนเงิน (บาท)',
                      hintStyle: GoogleFonts.itim(
                        color: const Color.fromARGB(255, 104, 102, 102),
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyBillWave,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    controller: personCtrl,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.itim(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 146, 9, 55),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 235, 54, 54),
                        ),
                      ),
                      hintText: 'ป้อนจำนวนคน (คน)',
                      hintStyle: GoogleFonts.itim(
                        color: const Color.fromARGB(255, 104, 102, 102),
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.person,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      onChanged: (value) {
                        //ต้องใช้ setstate เท่านั้นในการเล่นกับ Checkbox
                        setState(() {
                          tipCheck = value!;
                          if (value == false) {
                            tipCtrl.text = '';
                          }

                          //กดยกเลิกเพื่อให้เลขหาย
                        });
                      },
                      value: tipCheck,
                      checkColor: const Color.fromARGB(255, 245, 223, 23),
                      activeColor: Colors.black,
                      side: BorderSide(
                        color: Color.fromARGB(255, 235, 69, 57),
                      ),
                    ),
                    Text(
                      'เงินทิป (บาท)',
                      style: GoogleFonts.itim(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: TextField(
                    enabled: tipCheck,
                    controller: tipCtrl,
                    keyboardType: TextInputType.number,
                    style: GoogleFonts.itim(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 146, 9, 55),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 99, 97, 97),
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 99, 97, 97),
                        ),
                      ),
                      hintText: 'ป้อนจำนวนเงินทิป (บาท)',
                      hintStyle: GoogleFonts.itim(
                        color: const Color.fromARGB(255, 104, 102, 102),
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyCheckDollar,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        if (moneyCtrl.text.isEmpty == true) {
                          //แปลว่ายังไม่ได้ป้อน แสดงข้อความเตือน
                          _showWarningDialog(context, 'ป้อนจำนวนเงินด้วย...');
                        } else if (personCtrl.text.isEmpty == true) {
                          //แปลว่ายังไม่ได้ป้อน แสดงข้อความเตือน
                          _showWarningDialog(context, 'ป้อนจำนวนคนด้วย...');
                        } else if (tipCheck == true) {
                          if (tipCtrl.text.isEmpty == true) {
                            //แปลว่ายังไม่ได้ป้อน แสดงข้อความเตือน
                            _showWarningDialog(context, 'ป้อนจำนวนทิปด้วย...');
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowMoneyShareUI(
                                  money: moneyCtrl.text,
                                  person: personCtrl.text,
                                  tip: tipCtrl.text,
                                ),
                              ),
                            );
                            //เปิดหน้าจอพร้อมส่ง เงิน คน ทิปที่ป้อน
                          }
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowMoneyShareUI(
                                money: moneyCtrl.text,
                                person: personCtrl.text,
                                tip: '0',
                              ),
                            ),
                          );
                          //   ไปอีกหน้าจอพร้อมส่ง เงิน คนที่ป้อน และทิปเป็น 0
                          //   Navigator.push(//เปิดหน้าจอพร้อมส่ง เงิน คนที่ป้อน และทิปเป็น 0
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ShowMoneyShareUI(),
                          //   ),
                          // );
                        }
                      },
                      icon: Icon(
                        Icons.calculate,
                      ),
                      label: Text(
                        'คำนวณ',
                        style: GoogleFonts.itim(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.35,
                          MediaQuery.of(context).size.width * 0.14,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.03,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.cancel,
                      ),
                      label: Text(
                        'ยกเลิก',
                        style: GoogleFonts.itim(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.35,
                          MediaQuery.of(context).size.width * 0.14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
