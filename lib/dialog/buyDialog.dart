import 'package:flutter/material.dart';
import 'package:project/settings.dart';

class buyDialog extends StatefulWidget {
  @override
  State<buyDialog> createState() => _buyDialogState();
}

class _buyDialogState extends State<buyDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  color: mGray, borderRadius: BorderRadius.circular(4)),
              child: Image.asset('assets/Semen.png'),
            ),
            Container(
              height: 48,
              margin: EdgeInsets.only(left: 10),
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
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                height: 30,
                margin: EdgeInsets.only(left: 30),
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                    color: mGreen, borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'Add +',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 10,
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
