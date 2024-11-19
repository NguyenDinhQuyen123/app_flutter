import 'package:flutter/material.dart';
import 'package:three_screen/main.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Dang ky

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Thanh trang thai
                //  Container(
                //   padding: const EdgeInsets.all(9.0),
                //   color: const Color.fromARGB(255, 50, 205, 190),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [

                //       Text(
                //         '9:41',
                //         style: TextStyle(fontSize: 18,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.white,
                //         ),
                //       ),
                //       Row(
                //         // Các iconn
                //         children: [

                //           Icon(Icons.signal_cellular_4_bar, size: 20, color: Colors.white,),
                //           SizedBox(width: 4),
                //           Icon(Icons.wifi, size: 20,color: Colors.white),
                //           SizedBox(width: 4),
                //           Icon(Icons.battery_full, size: 20,color: Colors.white,)
                //         ],
                //       ),
                //     ],
                //   ),
                // ),

                //Khung
                Container(
                  height: 120,

                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 50, 205, 190),
                    borderRadius: BorderRadius.only(),
                  ),

                  //Logo
                  child: Padding(
                      padding: const EdgeInsets.only(left: 35.0, bottom: 30),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Image.asset('images/Group.png'),
                          ),
                        ),
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 25.0, bottom: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // khung ngang
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        // Travel and guide
                        Row(
                          children: [
                            Image.asset('images/select.png'),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              'Traveled',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              width: 120,
                            ),
                            Image.asset('images/Oval.png'),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "Guide",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                // Last name and first name
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // First Name
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "First Name",
                                  labelStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  hintText: 'Le',
                                  hintStyle: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 37, 35, 35)
                                              .withOpacity(0.6),
                                      fontSize: 15),
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                            ),
                            const SizedBox(
                                width:
                                    25), // Khoảng cách giữa First Name và Last Name
                            // Last Name
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Last Name",
                                  labelStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  hintText: 'Thu Thao',
                                  hintStyle: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 37, 35, 35)
                                              .withOpacity(0.6),
                                      fontSize: 15),
                                  border: const UnderlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        // Country
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Country',
                            labelStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            hintText: 'VietNam',
                            hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 37, 35, 35)
                                    .withOpacity(0.6),
                                fontSize: 15),
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                        // Email
                        const SizedBox(
                          height: 25,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            hintText: 'thao101191@donga.eu.vn',
                            hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 37, 35, 35)
                                    .withOpacity(0.6),
                                fontSize: 15),
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                        // Password
                        const SizedBox(
                          height: 25,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            hintText: '***********',
                            hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 37, 35, 35)
                                    .withOpacity(0.6),
                                fontSize: 15),
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                        //Confirm Password
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            hintText: '***********',
                            hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 37, 35, 35)
                                    .withOpacity(0.6),
                                fontSize: 15),
                            border: const UnderlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                        const SizedBox(height: 40),
                        // By sign Up
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              " By Signing Up,you agree to our",
                              style: TextStyle(),
                            ),
                            Text(
                              " Terms & Conditions",
                              style: TextStyle(
                                color: Colors.teal,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Buttom sign Up
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00C48C),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                splashFactory: NoSplash.splashFactory,
                              ),
                              onPressed: () => {
                                // Navigator.pushNamed(context, '/homepage'),
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyChatPage(
                                      title: 'My chat page',
                                    ),
                                  ),
                                ),
                              },
                              child: const Text(
                                "SIGN UP",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Already
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // Thanh ngang cuoi trang
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Image.asset('images/thanhngang.png')],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
