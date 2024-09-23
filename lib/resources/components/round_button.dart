import 'package:flutter/material.dart';
import 'package:getx_with_mvc/resources/colors/app_color.dart';

class RoundButton extends StatefulWidget {
  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  const RoundButton(
      {super.key,
      this.buttonColor = AppColor.blackColor,
      this.textColor = AppColor.whiteColor,
      required this.title,
      required this.onPress,
      this.height = 50,
      this.width = 120,
      this.loading = false});

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              color: widget.buttonColor, borderRadius: BorderRadius.circular(50)),
          child: widget.loading
              ? Center(
                  child: CircularProgressIndicator(
                  color: widget.textColor,
                ))
              : Center(
                  child: Text(widget.title,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 20
                  ),),
                )),
    );
  }
}
