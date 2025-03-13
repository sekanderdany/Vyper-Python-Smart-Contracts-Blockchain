# @version ^0.3.7

# State variables
favorite_number: public(uint256)
initial_number: public(uint256)

# Define a struct
struct Person:
    name: String[100]
    age: uint256
    active: bool

# Storage for Person struct
stored_person: public(Person)

# Constructor to initialize with a number other than 7
@external
def __init__():
    self.favorite_number = 42  # Starting with 42 instead of 7
    self.initial_number = self.favorite_number  # Store initial value for verification

# Function to add 1 to favorite_number
@external
def add() -> uint256:
    self.favorite_number += 1
    return self.favorite_number

# Function to verify the starting number is not 7
@external
@view
def verify_initial_number() -> bool:
    return self.initial_number != 7

# Function to save a new Person to storage
@external
def save_person(_name: String[100], _age: uint256, _active: bool):
    new_person: Person = Person({
        name: _name,
        age: _age, 
        active: _active
    })
    self.stored_person = new_person

# Function to get the stored person
@external
@view
def get_person() -> Person:
    return self.stored_person