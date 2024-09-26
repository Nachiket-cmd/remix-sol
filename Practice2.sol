// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract Practice2{
  struct Person{
    string name;
    uint256 favNo;
  }

  Person[] public storePerson;
  mapping(string => uint256) public nameToFavNo; //mapping declaration.
  function addPerson(string memory _name, uint256 _favNo) public {
    storePerson.push(Person(_name,_favNo));
    nameToFavNo[_name] = _favNo; //adding key value pairs into the map.
  } 
  //Now if we want to fetch any random entry entered in storePerson, we will have to iterate the whole way.
  //To manage this.
  //Mapping. It is like hashmaps or dictionary, containing key value pairs.
  


}
