# This is how we tell the vyper compiler
# what version to use

# pragma version ^0.4.0
# @license MIT

#has_fav_number: bool
#my_address: address
#my_decimal: decimal
#my_bytes: bytes32 

struct Person:
    favorite_number: uint256
    name: String[100]

my_name: public(String[100])
my_fav_number: public(uint256) # 0

list_of_numbers: public(uint256[5])
list_of_people: public(Person[5])
index: public(uint256)

name_to_favorite_number: public( HashMap[String[100], uint256] )

# Constructor
@deploy
def __init__():
    self.my_fav_number =7
    self.index = 0
    self.my_name = 'Dany'

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

@external
def add_person(name: String[100], favorite_number: uint256):
    self.list_of_numbers[self.index] = favorite_number

    #Add the Person to the Person's list
    new_person: Person = Person(favorite_number = favorite_number, name = name)
    
    self.list_of_people[self.index] = new_person
    
    # Add the person the the hashmap
    self.name_to_favorite_number[name] = favorite_number
    self.index = self.index + 1