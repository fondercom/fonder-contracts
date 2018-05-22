pragma solidity ^0.4.13;

contract Ownable {
	
  address public owner;
  address newOwner_;

  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor() public {
    owner = msg.sender;
  }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
  
  /**
   * @dev Throws if called by any account other than the new owner.
   */
   modifier onlyNewOwner() {
    require(msg.sender == newOwner_);
    _;
  }

  /**
   * @dev Allows the current owner to set the address they would like to take ownership of the contract.
   * This allows for some security over acidental ownership transfer.
   * @param newOwner The address to transfer ownership to.
   */
  function setNewOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    newOwner_ = newOwner;
  }
  
    /**
   * @dev Allows the new owner to accept transfer of the contract.
   */
  function acceptOwnership() public onlyNewOwner {
    require(newOwner_ != address(0));
    emit OwnershipTransferred(owner, newOwner_);
    owner = newOwner_;
  }

}