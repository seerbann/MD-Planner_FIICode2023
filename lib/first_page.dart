import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_hub/responsive.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: Scaffold(
          appBar: AppBar(),
        ),
        tablet: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
          ),
        ),
        //committ
        desktop: Scaffold(
          appBar: AppBar(actions: <Widget>[
            TextButton(
              onPressed: () {},
              child: const Text('About'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
            //change
            TextButton(
              onPressed: () {},
              child: const Text('Contact'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Policy'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            )
          ], backgroundColor: Colors.black),
          body: Container(
            color: Colors.black,
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 500,
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 30),
                            ),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 5,
                        child: Image.asset('assets/images/bigLogo.png'))
                  ]),
            ),
          ),
        ));
  }
}
