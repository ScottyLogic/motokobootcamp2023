1. How much is the current memory capacity of a canister?

Currently, the maximum capacity of a canister is 8 GB, but there is a plan to increase the capacity to 300 GB with future implementations.
With that said, it can also depend on the specific configuration of the network.  Furthermore, the network is still under development, so the memory capacity of a canister on the Internet Computer is not fully determined yet.

NOTE: This topic seems to be all over the place at the moment. It doesn't seem anyone can agree on any one solid number.


2. What is the issue with the following code sample?
```
actor {
  let counter : Nat = 0;
  public func increment_counter() : async () {
    counter := counter + 1;
  };
}
```

`counter` has been declared as a constant (immutable), not a variable. An error will occur when trying to assign a new value.


3. What is the issue with the following code sample?
```
actor {
  var message : Text = 0;

  public query func change_message(new_message : Text) : async () {
    message := new_message;
    return;
  };
  
  public query func see_message() : async Text {
    return(message);
  };
}
```

`message` is declared as type 'Text' but is given a 'Nat' value, which is not allowed.


4. False or True: we can remove the keyword async for return argument of a query function since queries are faster to answer.

False
