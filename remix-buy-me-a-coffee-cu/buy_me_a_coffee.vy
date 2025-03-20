# pragma version 0.4.0 
"""
@license MIT 
@title Buy Me A Coffee!
@author You!
@notice This contract is for creating a sample funding contract
"""

@internal
@payable
def _fund():
    """Allows users to send $ to this contract
    Have a minimum $ amount to send

    1. How do we send ETH to this contract?
    """
    
    assert msg.value == as_wei_value(1, "ether")

@external
def withdraw():
    pass