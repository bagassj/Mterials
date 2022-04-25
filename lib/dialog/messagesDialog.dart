import 'package:flutter/material.dart';
import 'package:project/screen/main.dart';
import 'package:project/settings.dart';

class messagesDialog extends StatefulWidget {
  final icon;
  final String text;
  final bool isMessage;
  final bool isFinal;
  messagesDialog(
      {Key? key,
      required this.icon,
      required this.text,
      required this.isMessage,
      required this.isFinal})
      : super(key: key);
  @override
  State<messagesDialog> createState() => _messagesDialogState();
}

class _messagesDialogState extends State<messagesDialog> {
  @override
  Widget build(BuildContext context) {
    if (widget.isMessage == true) {
      Future.delayed(Duration(seconds: 5), () {
        showDialog(
          context: context,
          builder: (ctxt) => new messagesDialog(
            icon: Icons.check_circle,
            text: 'Pesanan Dikonfirmasi',
            isMessage: false,
            isFinal: false,
          ),
        );
      });
    }
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: widget.isMessage ? Colors.black54 : mGreen,
                size: 32,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: widget.isMessage ? mGray : mGreen, fontSize: 14),
              ),
              widget.isMessage
                  ? SizedBox()
                  : GestureDetector(
                      onTap: () {
                        widget.isFinal
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => mainApp()))
                            : showDialog(
                                context: context,
                                builder: (ctxt) => new messagesDialog(
                                  icon: Icons.check_circle,
                                  text: 'Pesanan Diterima',
                                  isMessage: false,
                                  isFinal: true,
                                ),
                              );
                      },
                      child: Container(
                        width: 100,
                        height: 30,
                        margin: EdgeInsets.only(top: 30),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: mGreen,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'OK',
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
      ),
    );
  }
}
