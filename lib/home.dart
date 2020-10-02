import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  var feedBack = "VERY POOR";
  var rating = 0.0;
  var emoji = FontAwesomeIcons.solidSadCry;
  Color emojiColor = Colors.red;
  setrating(var value) {
    setState(() {
      rating = value;
      if (value >= 0.0 && value < 1.0) {
        emoji = FontAwesomeIcons.solidSadCry;
        emojiColor = Colors.red;
        feedBack = "VERY POOR";
      }
      if (value >= 1.0 && value < 2.0) {
        emoji = FontAwesomeIcons.sadTear;
        emojiColor = Colors.red;
        feedBack = "POOR";
      }
      if (value >= 2.0 && value < 3.0) {
        emoji = FontAwesomeIcons.frown;
        emojiColor = Colors.deepOrange;
        feedBack = "BELOW AVERAGE";
      }
      if (value >= 3.0 && value < 4.0) {
        emoji = FontAwesomeIcons.meh;
        emojiColor = Color(0xfff0a500);
        feedBack = "AVERAGE";
      }
      if (value >= 4.0 && value < 5.0) {
        emoji = FontAwesomeIcons.smile;
        emojiColor = Colors.green;
        feedBack = "GOOD";
      }
      if (value >= 5.0) {
        emoji = FontAwesomeIcons.laugh;
        emojiColor = Color(0xff206a5d);
        feedBack = "EXCELLENT";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ANIMATOR"),
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Color(0xff0F3057),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              child: Text(
                "PROVIDE YOUR FEEDBACK!!!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Align(
                child: Material(
                  color: Color(0xfff5f1da),
                  elevation: 35.0,
                  //borderRadius: BorderRadius.circular(24.0),
                  child: Container(
                    width: 350.0,
                    height: 350.0,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 8.0),
                          child: Container(
                            child: Text(
                              feedBack,
                              style: TextStyle(fontSize: 26.0),
                            ),
                          ),
                        ),
                        Container(
                          child: Icon(
                            emoji,
                            color: emojiColor,
                            size: 100.0,
                          ),
                        ),
                        Container(
                            child: RatingBar(
                          initialRating: 0.0,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          unratedColor: Colors.grey[300],
                          itemCount: 5,
                          glowColor: Colors.amber,
                          itemPadding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 10.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            setrating(rating);
                          },
                        )),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 10.0, top: 0.0),
                          child: Container(
                              child: Text(
                            "Rating : $rating",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                              child: Align(
                            alignment: Alignment.bottomCenter,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              color: Color(0xff07689f),
                              elevation: 15.0,
                              child: Text(
                                'Submit',
                                style: TextStyle(color: Color(0xffffffff)),
                              ),
                              onPressed: () {
                                Fluttertoast.showToast(
                                    msg: "Thank You!!!",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Color(0xfff5f1da),
                                    textColor: Colors.black,
                                    fontSize: 24.0);
                              },
                            ),
                          )),
                        ),
                      ],
                    ),
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
