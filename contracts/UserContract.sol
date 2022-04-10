pragma solidity ^0.8.13;

contract UserContract
{
    struct Cont 
    {
        uint FarmerAdhaar;
        uint BuyerAdhaar;
        uint quantity;
        uint sellingPrice;
        string FromLocation;
        string ToLocation;
        string date;
    }
    uint256 public contractNumber;
    mapping(uint256 => Cont) public  contracts;

    event ContractCreated(string ToLocation,string FromLocation,uint quantity);

    constructor() public
    {   
    
        contracts[0] = Cont(1,1,1,1,"default","default","default");
        contractNumber = 1;

    }
    function createContract(uint farmerAdhaar,uint  buyerAdhaar,uint quantity,uint  amount,string memory fromLocation,string memory toLocation,string memory date) public 
    {
        contracts[++contractNumber] = Cont(farmerAdhaar,buyerAdhaar,quantity,amount,fromLocation,toLocation,date);
        emit ContractCreated(toLocation,fromLocation,quantity);
    }

}