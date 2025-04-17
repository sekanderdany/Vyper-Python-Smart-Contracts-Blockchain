# pragma version 0.4.0 
"""
@license MIT 
@title Buy Me A Coffee!
@author Dany!
@notice This contract is for creating a sample funding contract
"""

# We'll learn a new way to do interfaces later...
interface AggregatorV3Interface:
    def decimals() -> uint8: view
    def description() -> String[1000]: view
    def version() -> uint256: view
    def latestAnswer() -> int256: view

minimum_usd: public(uint256) 
price_feed: AggregatorV3Interface # 0x694AA1769357215DE4FAC081bf1f309aDC325306 sepolia

@deploy
def __init__(price_feed_address: address):
    self.minimum_usd = 5  # Set the minimum in terms of USD-equivalent value
    self.price_feed = AggregatorV3Interface(price_feed_address)

@external
@payable
def fund():
    """Allows users to send $ to this contract
    Have a minimum $ amount to send

    1. How do we send ETH to this contract?
    """
    # assert msg.value >= as_wei_value(1, "ether"), "You must spend more ETH!"
    assert msg.value >= self.minimum_usd, "You must spend more ETH!"
    # http GET
    # 1086.80500 

@external
def withdraw():
    pass

@internal
def _get_eth_to_usd_rate(eth_amount: uint256):

"""
Chris sent us 0.01 ETH for us to buy a coffee.
Is that more or less than $57?

"""
    # Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
    #ABI
    price: int256 = staticcall self.price_feed_latestAnswer()


# @external
# @view
# def get_price() -> int256:
#     price_feed: AggregatorV3Interface = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
#     return staticcall price_feed.latestAnswer()