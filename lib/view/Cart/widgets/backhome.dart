import 'package:flutter/material.dart';

class BackHome extends StatelessWidget {
  const BackHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed("/home");
        
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      child: const Text(
        "Back home",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      
    );
  }
}
