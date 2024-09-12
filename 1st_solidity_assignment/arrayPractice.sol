//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Understanding structs
/// @author Adams Gbenga
/// @notice This contract shows how structs can be used just like arrays
/// @dev All function calls are currently implemented without side effects
/// @custom:educational this contracts was used for learning purposes

contract PracticingStructs {
    /// @notice This is the object Product for all items
    struct Product {
        uint256 id;
        string name;
        uint256 price;
        uint256 stock;
        string manufacturer;
        bool isAvailable;
    }

    // @param products broadens the different types of the object Product
    /// @dev Making products public enables us to call any products with its index
    /// @notice input product index to get product details
    Product[] public products;

    ///@dev Question can you pass any value apart from true and false to the variable isAvailable?
    ///@notice create any object "Product"
    function inputProduct(
        uint256 _id,
        string memory _name,
        uint256 _price,
        uint256 _stock,
        string memory _manufacturer,
        bool _isAvailable
    ) public {
        products.push(
            Product({
                id: _id,
                name: _name,
                price: _price,
                stock: _stock,
                manufacturer: _manufacturer,
                isAvailable: _isAvailable
            })
        );
    }

    /// Return the amount of elements available in the array
    function getLength() public view returns (uint256) {
        return products.length;
    }

    ///@notice this will delete the most recently added element to the array products
    function popProduct() public returns (bool) {
        products.pop();
        return true;
    }

    ///@dev using the randomShiftDelete will leave the arrays element out of order
    ///@notice the product in the index you inputed has been replaced with the last element of the array
    function randomShiftDelete(uint _index) public returns (bool) {
        products[_index] = products[products.length - 1];
        products.pop();
        return true;
    }

    ///@dev using the leftShiftDelete will leave the arrays element in order
    ///@notice the product in the index you inputed has been replaced with the next element of the array
    function leftShiftDel(uint _index) public returns (bool) {
        delete products[_index]; //what does this line do?
        for (uint i = _index; i < products.length - 1; i++) {
            products[i] = products[i + 1];
        }
        products.pop();
        return true;
    }
}
