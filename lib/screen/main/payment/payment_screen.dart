import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import '../../../utils/colors.dart';
import '../../../view/bill_item_view.dart';

class PaymentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PaymentScreenState();
  }
}

class PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Text(
            textAlign: TextAlign.center,
            "Bill",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: IconButton(
            icon: SizedBox(
                height: 24,
                width: 24,
                child: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: COLOR_PRIMARY,
                )),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Image.asset(
                      Assets.imagesDinner,
                      width: 80,
                      height: 80,
                      color: ORANGE,
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Sat,12 Jan,2023 | 9:35pm',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    )
                  ],
                ),
                //
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: LIGHT_RED,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Order Number',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'D-00017',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: LIGHT_RED,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Table',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '017',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: LIGHT_RED,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Captain Id',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '1478',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(top:4.0, left: 12, right: 12),
                      child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.vertical,
                          itemCount: 15,
                          itemBuilder: (_, position) {
                            return BillItemView();
                          }),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(borderRadius:
                  BorderRadius.vertical(top: Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, -1),
                            spreadRadius: 0,
                            blurRadius: 0),
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(-1, -1),
                            spreadRadius: 0,
                            blurRadius: 0)
                      ]
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Sub Total',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            '1800 \$',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Discount',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            '-',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Tax ',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            '32',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text(
                            'Total Amount',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text('2860 \$', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 54),
                          padding: EdgeInsets.symmetric(vertical: 8), // Set the padding
                        ),
                        onPressed: () {},
                        child: Text(
                          'Next',
                          style: TextStyle(fontSize: 16, letterSpacing: 1),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );}

}
