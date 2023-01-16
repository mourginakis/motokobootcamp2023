

1. How much is the current memory capacity of a canister?
 - Canister stable memory is limited to 4GB due to wasmtime's 32bit addressing but is currently undergoing NNS proposals that upgrade the network's code to raise the limit to 300GB.
 - https://forum.dfinity.org/t/increased-canister-smart-contract-memory/6148

2. What is the issue with the following code sample?
- `let counter : Nat = 0;` should be `var counter : Nat = 0;`

 3. What is the issue with the following code sample?
- `change_message` should not be a query function.

 4. False or True: we can remove the keyword async for return argument of a query function since queries are faster to answer.
- False, it is still asynchronous