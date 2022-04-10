import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:flutter/services.dart';
import "package:flutter/widgets.dart";
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class ListModel extends ChangeNotifier {
  late Credentials _credentials;
  bool isLoading = true;
  List<Cont> contracts = [];
  final String _rpcUrl = "http://127.0.0.1:7545";
  final String _wsUrl = "ws://127.0.0.1:7545/";
  int contractCount = 0;
  final String _privateKey =
      "ff21d5e7155138478e1e7648fa4c4d4c3ed507a1e3d0e8faabba7c15d88bba18";
  late Web3Client _client;
  late String _abiCode;
  late EthereumAddress _contractAddress;
  late EthereumAddress _ownAddress;
  late DeployedContract _contract;
  late ContractFunction _contractNo;
  late ContractFunction _contracts;
  late ContractFunction _createContract;
  late ContractEvent _contractCreated;
  ListModel() {
    initiateSetup();
  }
  Future<void> initiateSetup() async {
    _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });
    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }

  Future<void> getAbi() async {
    String abiStringFile =
        await rootBundle.loadString("src/abis/UserContract.json");
    var jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi['abi']);
    _contractAddress =
        EthereumAddress.fromHex(jsonAbi['networks']['5777']['address']);
  }

  Future<void> getCredentials() async {
    _credentials = await EthPrivateKey.fromHex(_privateKey);
    _ownAddress = await _credentials.extractAddress();
  }

  Future<void> getDeployedContract() async {
    print("Here");
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "UserContract"), _contractAddress);
    _contractNo = _contract.function('contractNumber');
    _contracts = _contract.function("contracts");
    _createContract = _contract.function('createContract');
    _contractCreated = _contract.event("ContractCreated");
  }

  getContracts() async {
    List totalcontractCount = await _client
        .call(contract: _contract, function: _contractNo, params: []);
    BigInt totalContracts = totalcontractCount[0];
    contractCount = totalContracts.toInt();
    print("Here");
    if (contractCount == 0) {
      isLoading = false;
      exit(1);
    }
    contracts.clear();
    for (var i = 0; i < totalContracts.toInt(); i++) {
      var temp = await _client.call(
          contract: _contract, function: _contracts, params: [BigInt.from(i)]);
      contracts.add(Cont(
          farmerAdhaar: temp[0],
          buyerAdhaar: temp[1],
          quantity: temp[2],
          sellingPrice: temp[3],
          fromLocation: temp[4],
          toLocation: temp[5],
          date: temp[6]));
    }
    isLoading = false;
    notifyListeners();
  }

  addTask(int farmerAdhaar, int buyerAdhaar, int quantity, int sellingPrice,
      String fromLocation, String toLocation, String date) async {
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract,
            function: _createContract,
            parameters: [
              farmerAdhaar,
              buyerAdhaar,
              quantity,
              quantity,
              fromLocation,
              toLocation,
              date
            ]));
    getContracts();
  }
}

class Cont {
  int farmerAdhaar;
  int buyerAdhaar;
  int quantity;
  int sellingPrice;
  String fromLocation;
  String toLocation;
  String date;
  Cont(
      {required this.farmerAdhaar,
      required this.buyerAdhaar,
      required this.quantity,
      required this.sellingPrice,
      required this.fromLocation,
      required this.toLocation,
      required this.date});
}
