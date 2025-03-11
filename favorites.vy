# This is how we tell the vyper compiler
# what version to use

# pragma version ^0.4.0
# @license MIT

#has_fav_number: bool
#my_address: address
#my_decimal: decimal
#my_bytes: bytes32 


my_fav_number: public(uint256) # 0

# Constructor

@deploy
def __init__():
    self.my_fav_number =7
    
@external
def store(new_num: uint256):
   self.my_fav_number = new_num

@external
@view
def retrieve() -> uint256:
    return self.my_fav_number

