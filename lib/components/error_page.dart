import 'package:flutter/cupertino.dart';

import 'button.dart';

class ErrorPage extends StatelessWidget {
  final String error;
  final Function() onPressed;
  const ErrorPage({required this.error, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error,style: const TextStyle(fontSize: 16, height: 1.6),textAlign: TextAlign.center,maxLines: 3,),
          const SizedBox(height: 16,),
          Button(
              text: "Retry",
              onPressed: onPressed
          )
        ],
      ),
    );
  }
}
