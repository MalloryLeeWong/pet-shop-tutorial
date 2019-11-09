pragma solidity ^0.5.0;

// you can write tests in JS or Solidity, below is Solidity

// gives us assertions to use in our tests like checking for equality
import "truffle/Assert.sol";
// this test contract gets the address of the deployed contract
import "truffle/DeployedAddresses.sol";
// the contract we want to test
import "../contracts/Adoption.sol";

// testing the smart contract Adoption
contract TestAdoption {
  // assigning a variable to result of invoking the Adoption contract to be tested to find its address
  Adoption adoption = Adoption(DeployedAddresses.Adoption());
  uint expectedPetId = 8;
  // set the adopter address to the address of this test contract since this test contract will send transaction
  address expectedAdopter = address(this);

// testing the adopt func inside the contract
  function testUserCanAdoptPet() public {
    uint returnedId = adoption.adopt(expectedPetId);

    Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
  }
    // Testing retrieval of a single pet's owner
  function testGetAdopterAddressByPetId() public {
    address adopter = adoption.adopters(expectedPetId);

    Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
  }

  // Testing retrieval of all pet owners
  function testGetAdopterAddressByPetIdInArray() public {
    // Store adopters in memory temporarily rather than in contract's storage
    address[16] memory adopters = adoption.getAdopters();

    Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
  }

}

