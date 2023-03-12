
import 'package:flutter/material.dart';
import 'package:frontend/models/coin_dto.dart';
import 'package:frontend/utils/coin/coin_utils.dart';

class ShowCoin extends StatefulWidget {

  @override
  _ShowCoinState createState() => _ShowCoinState();
}

class _ShowCoinState extends State<ShowCoin> {

  late List<CoinDTO> coins;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _showCoinsAppBar(),
      body: FutureBuilder<List<CoinDTO>>(
          future: CoinUtils.getCoins(),
          builder: (BuildContext context,AsyncSnapshot<List<CoinDTO>> promisedCoins) {
            switch(promisedCoins.connectionState){
              case ConnectionState.done:
                coins = promisedCoins.data!;
                return _showCoinsBody();
              default:
                return _progressIndicator();
            }

          }
      ),
    );
  }

  Widget _progressIndicator() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight,
      width: screenWidth,
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary),
        backgroundColor: Colors.black,
      ),
    );
  }

  AppBar _showCoinsAppBar() {
    return AppBar(
        centerTitle: true,
        title: const Text(
            "CoinRich",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 36)),
        backgroundColor: Colors.black);
  }

  Widget _showCoinsBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _showChartsTitle(context),
          coins.length > 0 ? _listCoins(context) : SizedBox.shrink()
        ],
      ),
    );
  }
  
  Widget _showChartsTitle(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(10),
      height: screenHeight*0.06,
      child: Row(
        children: [
          Icon(Icons.pie_chart_outline, color: Theme.of(context).colorScheme.primary),
          Text(" Show Chart", style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          const Spacer(),
          Text("Count: ${coins.length}")
        ],
      ),
    );
  }

  Widget _listCoins(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: coins.length,
      prototypeItem: _coinTile(context, coins.first),
      itemBuilder: (context, index) {
        return _coinTile(context, coins[index]);
      },
    );
  }

  Widget _coinTile(BuildContext context, CoinDTO coin) {

    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: _coinTitle(context, coin),
        subtitle: _coinSubtitle(context, coin),
        trailing: _coinTrailing(context, coin),
        tileColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
      ),
    );
  }

  _coinTitle(BuildContext context, CoinDTO coin) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 8),
      child: Row(
        children: [
          Text(coin.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.primary)),
          SizedBox(width: screenWidth*0.1),
          _getArrow(coin.percentChange24h),
          Text(" ${coin.percentChange24h.abs()}%", style: const TextStyle(fontSize: 13))
        ],
      ),
    );
  }

  Icon _getArrow(double value) {
    if(value<0) {
      return const Icon(Icons.arrow_downward, color: Colors.red, size: 20);
    }
    return const Icon(Icons.arrow_upward, color: Colors.green, size: 20);
  }
  
  _coinSubtitle(BuildContext context, CoinDTO coin) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: Row(
        children: [
          Text("Price  \$ ${coin.price}", style: const TextStyle(fontSize: 13)),
          SizedBox(width: screenWidth*0.1),
          Text("Rank  ${coin.cmcRank}", style: const TextStyle(fontSize: 13))
        ],
      ),
    );
  }
  
  Widget _coinTrailing(BuildContext context, CoinDTO coin) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Card(child: SizedBox(
            width: screenWidth*0.15,
            child: Text(coin.symbol, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)))),
        Icon(Icons.arrow_circle_right, color: Theme.of(context).colorScheme.primary, size: 30)
      ],
    );
  }

}