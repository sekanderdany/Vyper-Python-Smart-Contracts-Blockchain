# pragma version ^0.4.0
# @license MIT

# @oure - do not read any state and global variables
# @view - read state and global variables

count: public(uint256)
@external
@pure
def add(x: uint256, y: uint256) -> uint256:
    return x + y

    # this function will no loger be pure if we do this
    # becuase it is reading a value from state variable count 
    # and global variable block.timestamp

    # return x + y + self.count + block.timestamp

@external
@view
def add_to_count(x: uint256) -> uint256:
    return x + self.count + block.timestamp