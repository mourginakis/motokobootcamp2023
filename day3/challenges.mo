import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Text "mo:base/Text";
import Nat64 "mo:base/Nat64";
import Buffer "mo:base/Buffer";

// dfx deploy; dfx canister call challenges test

actor {


    
    public func test() : async () {
        // 1
        let q1 = 1;
        assert(q1 == 14);
        Debug.print("q1 pass");
    };
}