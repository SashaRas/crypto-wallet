import 'package:fire_book/net/firebaseAuthentication.dart';
import 'package:flutter/material.dart';

class AddCoin extends StatefulWidget {
  const AddCoin({Key? key}) : super(key: key);

  @override
  State<AddCoin> createState() => _AddCoinState();
}

class _AddCoinState extends State<AddCoin> {
  final List<String> dropDownItems = ['Bitcoin', 'Solana', 'Dogcoin'];

  String currentCoin = 'Bitcoin';

  final countController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            value: currentCoin,
            items: dropDownItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value ,
                child: Text(value));
            }).toList(), 
            onChanged: (value) => setState(() {
              currentCoin = value.toString();
            }),
            ),
            const Margin(),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: 20,
              child: TextFormField(
                controller: countController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '$currentCoin amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  )
                )
              ),
            ),
            const Margin(),
            ElevatedButton(onPressed: () async {
              await addCoinToFirebase(currentCoin, countController.text);
              Navigator.pop(context);
            }, child: const Text('Add', style: TextStyle(color: Colors.greenAccent, fontSize: 24,)))
        ],
      ),
    );
  }
}

class Margin extends StatelessWidget {
  const Margin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 30,
    );
  }
}