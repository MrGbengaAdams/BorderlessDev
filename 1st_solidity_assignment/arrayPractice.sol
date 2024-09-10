//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract ArrayPractice{

    struct Product {
    uint256 id;
    string name;
    uint256 price;
    uint256 stock;
    string manufacturer;
    bool isAvailable;

    }

    Product[] public products;


   function inputProduct(uint256 _id, string memory _name , uint256 _price, uint256 _stock, string memory _manufacturer, bool _isAvailable) public {
       products.push(Product(_id, _name, _price, _stock,  _manufacturer, _isAvailable));
       //used to input the products
    }



    function getLength() public view returns(uint256){
        return products.length;
        //this function will get the length of the elements in the array
    }

    function popProduct() public returns(bool){
        products.pop();
        return true;
        //this function will delete the rightmost element in the array of structs
    }

    function leftShiftDelete(uint _index) public returns (bool){
        products[_index] = products[products.length - 1];
        products.pop();
        return true;
    }



}

