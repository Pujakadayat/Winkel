import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:winkle_final/views/buyers/navscreen.dart/searchscreen.dart';

// class SearchInputWidget extends StatelessWidget {
//   const SearchInputWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(14.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: TextField(
//           decoration: InputDecoration(
//               fillColor: Colors.white,
//               filled: true,
//               hintText: 'Search For Products',
//               border: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//               ),
//               prefixIcon: Padding(
//                 padding: const EdgeInsets.all(14.0),
//                 child: SvgPicture.asset(
//                   'assets/icons/search.svg',
//                   width: 10,
//                 ),
//               )),
//         ),
//       ),
//     );
//   }
// }
class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen()),
            );
          },
          child: Container(
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    width: 20,
                  ),
                ),
                const Text(
                  'Search For Products',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
