1. Who controls the ledger canister?
    - The the ICP Ledger canister has a controller with the ID 'r7inp-6aaaa-aaaaa-aaabq-cai' which is the 'nns/root'
2. What is the subnet of the canister with the id: mwrha-maaaa-aaaab-qabqq-cai? How much nodes are running this subnet?
    - Motoko playground canister on subnet pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe
    - Currently running on 16 node machines and 431 canisters
3. I have a neuron with 1O ICPs locked with a dissolve delay of 4 years - my neuron has been locked for 2 years. What is my expected voting power?
    - 10 ICP 
    - 4 years: y = 0.0104x + 1 where x = months; y(4*12) = 1.4992
    - 2 Years maturity: y = 0.0625x + 1, where x = years; y(2) = 1.125
    - total = 10 * 1.4992 * 1.125 = 18.866

4. What is wrong with the following code?
    - Needs an `import Nat "mo:base/Nat";`
5. What is wrong with the following code?
    - Async fn can't return an array with mutable state
    - needs `import Array "mo:base/Array";`
    - Needs an `Array.freeze()` to be called on array.
    Better code:
```motoko
let languages : [var Text] = [var "English", "German", "Chinese", "Japanese", "French"];

public func show_languages(language : Text) : async [Text] {
return (Array.freeze(languages));
};
```
6. What is wrong with the following code?
    - Nothing. It runs perfectly fine and as expected when deployed.
    - Trick question?


