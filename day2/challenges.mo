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

    // 1
    public func average_array(array : [Int]) : async Int {
        Array.foldLeft(array, 0, Int.add) / array.size();
    };

    // 2
    public func count_character(t : Text, c : Char) : async Nat {
        Iter.size(Iter.filter(t.chars(), func (c2 : Char) : Bool { c == c2 }));
    };

    // 3
    public func factorial(n : Nat) : async Nat {
        Array.foldLeft(
            Iter.toArray(Iter.range(2, n)), 1, Nat.mul
        );
    };

    // 4
    public func number_of_words(t : Text) : async Nat {
        let tokens = Text.tokens(t, #predicate(func (c : Char) : Bool {c == ' '}));
        Iter.toArray(tokens).size();
    };

    // 5
    public func find_duplicates(a : [Nat]) : async [Nat] {
        Buffer.new();

        [1, 2];
    };

    // 6
    public func convert_to_binary(n : Nat) : async Text {
        var result = "";
        var v = n;
        while (v > 0) {
            result := result # Nat.toText(v % 2);
            v := v / 2;
        };

        let reversed = Array.reverse(Iter.toArray(result.chars()));

        let result2 = switch (reversed.size()) {
            case (0) "0";
            case (_) Text.fromIter(Iter.fromArray(reversed))
        };
        result2;
    };



    public func test() : async () {
        // 1
        let q1 = await average_array([3, 4, 5, 6, 9, 1, 3, 1, 94]);
        assert(q1 == 14);
        Debug.print("q1 pass");

        // 2
        let q2 = await count_character("motoko bootcamp in portugal", 'o');
        assert (q2 == 6);
        Debug.print("q2 pass");

        // 3
        let q3 = await factorial(6);
        let q31 = await factorial(0);
        assert (q3 == 720);
        assert (q31 == 1);
        Debug.print("q3 pass");

        // 4
        let q4 = await number_of_words("the quick brown fox jumped over the lazy dog");
        let q41 = await number_of_words("");
        let q42 = await number_of_words("one");
        assert (q4 == 9);
        assert (q41 == 0);
        assert (q42 == 1);
        Debug.print("q4 pass");


        // 5
        let q5 = await find_duplicates([1, 3, 3, 2, 7, 13, 2, 56, 13, 13]);
        assert (q5 == [3, 2, 13]);
        Debug.print("q5 pass");

        // 6
        let q6 = await convert_to_binary(123456789);
        let q61 = await convert_to_binary(0);
        assert (q6 == "111010110111100110100010101");
        assert (q61 == "0");
        Debug.print("q6 pass");


        Debug.print("\n\n\n");
        Debug.print(debug_show(Iter.toArray(Iter.range(1, 0))));
        Debug.print(debug_show(q1));
    };
 
}