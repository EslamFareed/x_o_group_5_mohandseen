import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> board = ["", "", "", "", "", "", "", "", ""];

  bool xTurn = true;
  bool gameEnd = false;

  void checkWin() async {
    if (board[0] == board[1] && board[0] == board[2] && board[0] != "" ||
        board[3] == board[4] && board[3] == board[5] && board[3] != "" ||
        board[6] == board[7] && board[6] == board[8] && board[6] != "") {
      print("${xTurn ? "O" : "X"} Won");
      gameEnd = true;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [],
          );
        },
      );

      // var time = await showTimePicker(
      //   context: context,
      //   initialTime: TimeOfDay.now(),
      // );
      // print(time);
      // var date = await showDatePicker(
      //   context: context,
      //   firstDate: DateTime(2000),
      //   lastDate: DateTime(2025),
      // );
      // print(date);
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     return Dialog(
      //       child: SizedBox(
      //         width: 200,
      //         height: 200,
      //         child: Column(
      //           children: [
      //             Text("${xTurn ? "O" : "X"} Won"),
      //             ElevatedButton(
      //               onPressed: () {
      //                 board = ["", "", "", "", "", "", "", "", ""];
      //                 xTurn = true;
      //                 gameEnd = false;
      //                 setState(() {});
      //                 Navigator.pop(context);
      //               },
      //               child: const Text("Restart"),
      //             )
      //           ],
      //         ),
      //       ),
      //     );
      // },
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return MaterialButton(
                  onPressed: () {
                    if (board[index] == "" && !gameEnd) {
                      if (xTurn) {
                        board[index] = "X";
                      } else {
                        board[index] = "O";
                      }
                      xTurn = !xTurn;
                      setState(() {});
                      checkWin();
                    }
                  },
                  color: Colors.grey[500],
                  child: Text(
                    board[index],
                    style: const TextStyle(fontSize: 70),
                  ),
                );
              },
              itemCount: board.length,
            ),
            Text(
              xTurn ? "X Turn" : "O Turn",
              style: const TextStyle(fontSize: 50),
            )
          ],
        ),
      ),
    );
  }
}
