import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_book/api/get_currency.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double bitcoin = 0.0;
  double solana = 0.0;
  double dogecoin = 0.0;

  @override
  void initState() {
    getCurrency();
  }

  getCurrency() async {
    bitcoin = await Provider.of<Currency>(context).getCryptoCurrency('bitcoin');
    solana = await Provider.of<Currency>(context).getCryptoCurrency('solana');
    dogecoin = await Provider.of<Currency>(context).getCryptoCurrency('dogecoin');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getCurrencyValues(String cryptoName, double amount) {
      if(cryptoName == 'bitcoin'){
        return bitcoin * amount;
      } else if(cryptoName == 'solana'){
        return solana * amount;
      } else if(cryptoName == 'dogecoin'){
        return dogecoin * amount;
      }
    }

    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("All_users").doc(FirebaseAuth.instance.currentUser!.uid).collection("Coins").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(!snapshot.hasData){
              return const Center(child: CircularProgressIndicator());
            }
            return ChangeNotifierProvider(
              create: (BuildContext context) => Currency(),
              child: ListView(
                children: snapshot.data!.docs.map((coin) {
                  return Column(
                    children: [
                      Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.blueGrey)
                        ),
                        child: Row(children: [
                          Text('Coin name: ${coin.id}', style: const TextStyle(color: Colors.greenAccent, fontSize: 24,),),
                          const SizedBox(width: 30,),
                          Text('Coin amount: \$${getCurrencyValues(coin.id, coin.get('Amount'))}', style: const TextStyle(color: Colors.greenAccent, fontSize: 24,))
                        ],),
                      ),
                      const SizedBox(height: 15,)
                    ],
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addCoinPage');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}