# This is how we tell the vyper compiler
# what version to use

# pragma version ^0.4.0
# @license MIT

#has_fav_number: bool
#my_address: address
#my_decimal: decimal
#my_bytes: bytes32 


my_fav_number: public(uint256) # 0

list_of_numbers: public(uint256[5])
index: public(uint256)

# Constructor

@deploy
def __init__():
    self.my_fav_number =7
    self.index = 0

@external
def store(new_num: uint256):
   self.my_fav_number = new_num

@external
@view
def retrieve() -> uint256:
    return self.my_fav_number

@external
def add_number(favorite_number: uint256):
    self.list_of_numbers[self.index] = favorite_number
    self.index = self.index + 1
