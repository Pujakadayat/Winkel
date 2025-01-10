
import 'package:flutter/material.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewInputWidget extends StatefulWidget {
  final Function(String, int) onSubmit;

  const ReviewInputWidget({required this.onSubmit, Key? key}) : super(key: key);

  @override
  _ReviewInputWidgetState createState() => _ReviewInputWidgetState();
}

class _ReviewInputWidgetState extends State<ReviewInputWidget> {
  final _controller = TextEditingController();
  int _rating = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(hintText: 'Write your review...'),
        ),
        Slider(
          value: _rating.toDouble(),
          min: 1,
          max: 5,
          divisions: 4,
          label: '$_rating',
          onChanged: (value) {
            setState(() {
              _rating = value.toInt();
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSubmit(_controller.text, _rating);
            _controller.clear();
          },
          child: Text('Submit Review'),
        ),
      ],
    );
  }
}