import 'package:flutter/material.dart';
import 'package:project/settings.dart';
import 'package:project/screen/progressMaps.dart';

class cartDialog extends StatefulWidget {
  @override
  State<cartDialog> createState() => _cartDialogState();
}

class _cartDialogState extends State<cartDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your Cart',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Text('total: 1.500.000',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: mGray, borderRadius: BorderRadius.circular(4)),
                    child: Image.asset('assets/Semen.png'),
                  ),
                  Container(
                    height: 48,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            'Semen Tiga Roda',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.remove_circle_outline,
                              size: 24,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                '10',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.control_point,
                              size: 24,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {}),
                    child: Container(
                      height: 48,
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child: Text(
                              '1.500.000',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              left: 10,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                                color: mRed,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              'Delete -',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => progress()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                  left: 10,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  color: mGreen,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'BUY',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
