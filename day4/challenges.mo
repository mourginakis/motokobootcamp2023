import Debug "mo:base/Debug";
import Prelude "mo:base/Prelude";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Principal "mo:base/Principal";
import List "mo:base/List";
import Buffer "mo:base/Buffer";
import Array "mo:base/Array";
import Option "mo:base/Option";
import Nat "mo:base/Nat";


// dfx deploy; dfx canister call challenges test
// dfx build; dfx canister install --all --mode upgrade; dfx canister call challenges test

actor {

    /// 1 -- done
    /// Takes l of type List.List
    /// returns new list with dupes removed
    func unique<T>(l : List.List<T>, equal : (T, T) -> Bool) : List.List<T> {
        var deduped = List.nil<T>();
        for (e in List.toIter<T>(l)){
            let is_duplicate = List.some(deduped, func (e2 : T) : Bool {equal(e, e2)});
            if (not is_duplicate) {
                deduped := List.push(e, deduped);
            }
        };
        List.reverse(deduped);
    };

    /// 2 -- done
    /// Takes l of type List.List
    /// returns reversed list
    func reverse<T>(l : List.List<T>) : List.List<T> {
        List.reverse(l);
    };

    /// 3 - done
    /// takes no arguments
    /// returns a Boolean indicating if the caller is anonymous or not
    public shared ({caller}) func is_anonymous() : async Bool {
        Principal.isAnonymous(caller)
    };

    /// 4
    /// three arguments, buf of type Buffer and val of type T
    /// index of the first occurrence of "val" in "buf"
    func find_in_buffer<T>(buf : Buffer.Buffer<T>, val: T, equal: (T,T) -> Bool) : ?Nat {
        Buffer.indexOf(val, buf, equal);
    };

    /// 5 - done
    let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);

    public shared ({ caller }) func add_username(name : Text) : async () {
      usernames.put(caller, name);
    };

    /// Return array of tuples (Principal, Text) of all entries in usernames
    public query func get_usernames() : async [(Principal, Text)] {
      return(Iter.toArray(usernames.entries()));
    };


    public shared ({caller}) func test() : async () {


        // 1
        let l = List.fromArray([0, 1, 2, 3, 4, 4, 5, 6, 7, 8, 9]);
        let q1 = unique<Nat>(l, Nat.equal);
        let expectation = List.fromArray([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
        assert (q1 == expectation);
        Debug.print("q1 pass");


        // 2
        let l2 = List.fromArray([0, 1, 2, 3, 4, 4, 5, 6, 7, 8, 9]);
        let e2 = List.fromArray([9, 8, 7, 6, 5, 4, 4, 3, 2, 1, 0]);
        assert(reverse(l2) == e2);
        Debug.print("q2 pass");

        // 3
        let anony = await is_anonymous();
        Debug.print("Anonymous: " # debug_show(anony));
        Debug.print("Principal: " # Principal.toText(caller));
        Debug.print("q3 pass");

        // 4
        let b = Buffer.fromArray<Nat>([0, 2, 4, 6, 8, 10, 12]);
        let ans = Option.get(find_in_buffer(b, 4, Nat.equal), -1);
        assert (ans == 2);
        Debug.print("q4 pass");

        Debug.print("All tests pass");
    };

}