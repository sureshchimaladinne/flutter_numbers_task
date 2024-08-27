// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../view/number_grid_screen.dart';
// import '../view_models/number_viewmodel.dart';
//
// import '../widgets/number_grid_item.dart';
//
// class NumberGridScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final viewModel = Provider.of<NumberViewModel>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Number Grid Highlight'),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: (String value) {
//               viewModel.setRule(value);
//             },
//             itemBuilder: (BuildContext context) {
//               return ['Odd Numbers', 'Even Numbers', 'Prime Numbers', 'Fibonacci Numbers']
//                   .map((String choice) {
//                 return PopupMenuItem<String>(
//                   value: choice,
//                   child: Text(choice),
//                 );
//               }).toList();
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 5,
//             childAspectRatio: 1,
//             mainAxisSpacing: 8.0,
//             crossAxisSpacing: 8.0,
//           ),
//           itemCount: viewModel.numbers.length,
//           itemBuilder: (context, index) {
//             return NumberGridItem(number: viewModel.numbers[index]);
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../models/number_model.dart';

class NumberGridItem extends StatelessWidget {
  final NumberModel number;

  NumberGridItem({required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: number.highlightColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          number.value.toString(),
          style: TextStyle(
            color: number.isHighlighted ? Colors.white : Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
