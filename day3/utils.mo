import Int "mo:base/Int";
import Debug "mo:base/Debug";
import Buffer "mo:base/Buffer";
import Nat "mo:base/Nat";
import Array "mo:base/Array";


module {
    /// 1 
    /// takes an array [Int] of integers
    /// returns the second largest number in the array
    public func second_maximum(a : [Int]) : Int {
        let _a = Buffer.fromArray<Int>(a);
            _a.sort(Int.compare);
        Buffer.removeDuplicates(_a, Int.compare);
        Buffer.reverse(_a);
        _a.get(1);
    };

    /// 2 
    /// that takes an array [Nat]
    /// returns a new array with only the odd numbers from the original array
    public func remove_even(a : [Nat]) : [Nat] {
        Array.filter<Nat>(a, func (n) {n % 2 == 1})
    };

    /// 3
    /// takes 2 parameters: an array [T] and a Nat n
    /// drop the n first elements of the array and returns the remainder
    public func drop<T>(a : [T], n : Nat) : [T] {
        let _a = Buffer.fromArray<T>(a);
        let (_, b) = Buffer.split<T>(_a, n);
        Buffer.toArray<T>(b);
    };

}