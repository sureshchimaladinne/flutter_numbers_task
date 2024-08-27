// import 'package:flutter/material.dart';
// import '../models/number_model.dart';
//
// class NumberGridItem extends StatelessWidget {
//   final NumberModel number;
//
//   NumberGridItem({required this.number});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: number.isHighlighted ? Colors.blueAccent : Colors.grey[300],
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Center(
//         child: Text(
//           number.value.toString(),
//           style: TextStyle(
//             color: number.isHighlighted ? Colors.white : Colors.black,
//             fontSize: 20,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/number_viewmodel.dart';

import '../widgets/number_grid_item.dart';

class NumberGridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NumberViewModel>(context);

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Number Grid Highlight',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [

          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white), // Set the icon color here
            onPressed: () {
              // Open the PopupMenu
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(100, 80, 0, 0),
                items: [
                  PopupMenuItem<String>(
                    value: 'Odd Numbers',
                    child: Text('Odd Numbers'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Even Numbers',
                    child: Text('Even Numbers'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Prime Numbers',
                    child: Text('Prime Numbers'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Fibonacci Numbers',
                    child: Text('Fibonacci Numbers'),
                  ),
                ],
              ).then((value) {
                if (value != null) {
                  viewModel.setRule(value);
                }
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 1,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount: viewModel.numbers.length,
          itemBuilder: (context, index) {
            return NumberGridItem(number: viewModel.numbers[index]);
          },
        ),
      ),
    );
  }
}
