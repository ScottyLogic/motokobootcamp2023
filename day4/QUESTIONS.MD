## 1. Is the heap memory saved when upgrading a canister? How much heap memory does a canister \[have\]?

No. 4GB


## 2. How \[many\] accounts can a unique Principal own?

2^32 = 4_294_967_296 accounts


## 3. Can we safely upgrade a canister from interface A to interface B?
**Interface A**
```motoko
actor {
  public func greet(surname : Text, firstname : Text) : async Text {
    return "Hello" # firstname # surname # " !";
  };
}
```
**Interface B**
```motoko
actor {
  public func greet(firstname : Text) : async Text {
    return "Hello" # firstname # " !";
  };
}
```

No