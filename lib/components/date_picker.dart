import 'package:flutter/material.dart';
import 'package:pehape_sikp/components/components.dart';
import 'package:pehape_sikp/constants.dart';

class DateDropDown extends StatelessWidget {
  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Widget child;

  const DateDropDown(
      {Key key,
      this.labelText,
      this.valueText,
      this.valueStyle,
      this.onPressed,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.topCenter,
      children: [
        TextFieldContainer(
          child: InkWell(
            onTap: onPressed,
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: labelText,
                border: InputBorder.none,
              ),
              baseStyle: valueStyle,
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Icon(Icons.event_note),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            valueText,
                            style: valueStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_drop_down,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.grey.shade700
                                    : Colors.white70,
                          ),
                          SizedBox(
                            width: 16,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 6,
          child: Container(
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: kRedColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(29),
                topRight: Radius.circular(29),
              ),
            ),
            padding: EdgeInsets.all(6),
            child: Center(
              child: Text(
                "Tanggal Lahir Mahasiswa",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
