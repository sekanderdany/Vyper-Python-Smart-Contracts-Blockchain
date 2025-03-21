# pragma version 0.4.0 
"""
@license MIT 
@title Buy Me A Coffee!
@author Dany!
@notice This contract is for creating a sample funding contract
"""

minimum_usd = uint256

@deploy
def __init__():
    self.minimum_usd = 5

@external
@payable
def fund():
    """Allows users to send $ to this contract
    Have a minimum $ amount to send

    1. How do we send ETH to this contract?
    """
    assert msg.value >= as_wei_value(1, "ether"), "You must spend more ETH!"
    # http GET

@external
def withdraw():
    pass