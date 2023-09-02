// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ShowMoneyShareUI extends StatefulWidget {
  //สร้างตัวแปรเพื่อรับข้่อมูลไปใช้งานต่อไป
  String? money;
  String? person;
  String? tip;

  ShowMoneyShareUI(
      {super.key,
      this.money,
      this.person,
      this.tip}); //ที่คอนสตัคเตอร์นำตัวฝั่งรับที่สร้าง มากำหนดเพื่อจะรับคำสั่งฝั่งที่ส่งมา

  @override
  State<ShowMoneyShareUI> createState() => _ShowMoneyShareUIState();
}

class _ShowMoneyShareUIState extends State<ShowMoneyShareUI> {
  var nf = NumberFormat('###,##0.00', "en_US");

  double? moneyShare = 0;
  @override
  void initState() {
    double money = double.parse(widget.money!);
    int person = int.parse(widget.person!);
    double tip = double.parse(widget.tip!);
    moneyShare = (money + tip) / person;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 165, 165),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 69, 57),
        title: Text(
          'แชร์เงินกันเถอะ (รวม)',
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
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Image.asset(
                'assets/images/Money.png',
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'จำนวนเงินที่จะแชร์',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 235, 69, 57),
                ),
              ),
              Text(
                nf.format(double.parse(widget.money!)),
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.white,
                ),
              ),
              Text(
                'บาท',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 235, 69, 57),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'จำนวนคนที่จะแชร์',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 235, 69, 57),
                ),
              ),
              Text(
                widget.person!,
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.white,
                ),
              ),
              Text(
                'บาท',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 235, 69, 57),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'จำนวนเงินทิป',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 235, 69, 57),
                ),
              ),
              Text(
                nf.format(double.parse(widget.tip!)),
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.white,
                ),
              ),
              Text(
                'บาท',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 235, 69, 57),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'แชร์เงินกันคนละ',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 235, 69, 57),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(255, 235, 69, 57),
                ),
                child: Center(
                  child: Text(
                    nf.format(moneyShare),
                    style: GoogleFonts.itim(
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Text(
                'บาท',
                style: GoogleFonts.itim(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: Color.fromARGB(255, 235, 69, 57),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
