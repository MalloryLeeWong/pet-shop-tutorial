pragma solidity ^0.5.0;

contract Adoption {
  // declaring a public var adopters which is an array of addresses with length 16
  address[16] public adopters;

  // adopting a pet
    // require() checks if the petId is within the array index range, since length is 16, must be 0 to 15 indices
    // msg.sender is the address of the person or smart contract that called this function
    // save the address as an element in the adopters array at the index equal to the petId

  function adopt(uint petId) public returns (uint) {
    require(petId >= 0 && petId <= 15);
    adopters[petId] = msg.sender;
    return petId;
  }

// getting the adopters array
// include memory keyword gives the address in memory for the var
// view keyword means func won't modify state of the contract
  function getAdopters() public view returns (address[16] memory) {
    return adopters;
  }

}

