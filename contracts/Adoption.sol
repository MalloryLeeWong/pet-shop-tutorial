pragma solidity ^0.5.0

contract Adoption {
  // declaring a public var adopters which is an array of addresses with length 16
  address[16] public adopters

  // adopting a pet
  function adopt(uint petId) public returns (unit) {
    // require() checks if the petId is within the array index range, since length is 16, must be 0 to 15 indices
    require(petId >= 0 && petId <= 15)
    // msg.sender is the address of the person or smart contract that called this function
    // save the address as an element in the adopters array at the index equal to the petId
    adopters[petId] = msg.sender
    // array getters only return a single value
    return petId
  }
}

function getAdopters() public view returns (address[16] memory) {
  return adopters
}
