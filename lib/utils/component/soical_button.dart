import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  String? title;
  String? image;
  Color? color, textColor;
  VoidCallback? onPress;

  bool loading;

  SocialButton(
      {this.color,
      this.image,
      this.title,
      this.loading = false,
      this.onPress,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onPress,
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(4, 4), // Shadow position
            ),
          ],
          color: color,
          border: Border.all(color: Colors.grey, width: 0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: loading
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.white,
              ))
            : Center(
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    image.toString(),
                    height: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    title!,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )),
      ),
    );
  }
}
