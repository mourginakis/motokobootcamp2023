1. Is the heap memory saved when upgrading a canister? How much heap memory does a canister has?
- Heap memory is not saved, but can be transferred into stable memory. Heap memory is limited to 4GB.

2. How much accounts can a unique Principal own?
- . A unique principal can own 4,294,967,295 accounts, the same value as an 32bit unsigned integer.

3. Can we safely upgrade a canister from interface A to interface B?
```motoko
actor {
  public func greet(surname : Text, firstname : Text) : async Text {
    return "Hello" # firstname # surname # " !";
  };
}
```
Interface B
```motoko
actor {
  public func greet(firstname : Text) : async Text {
    return "Hello" # firstname # " !";
  };
}
```
- Yes, we can safely upgrade. It is a non-breaking change. Tested with dfx just now. But we cannot do the inverse.