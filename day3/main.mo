import List "mo:base/List";
import Debug "mo:base/Debug";

import Utils "utils";
import Book "book";

// dfx deploy; dfx canister call challenges test

actor {

    // 6
    // create a list that stores books.
    var books = List.nil<Book.Book>();


    /// 7
    /// takes a book as parameter and returns nothing
    /// should add this book to your list
    public func add_book(b : Book.Book) : async () {
        books := List.push(b, books);
    };


    /// 8
    /// takes no parameter
    /// returns an Array that contains all books stored in the list

    public func get_books() : async [Book.Book] {
        List.toArray(books);
    };


    public func test() : async () {
        // 1
        let q1 = Utils.second_maximum([1, 3, 5, 3, 6, 3, 2, 3, 3, 8, 3, 5, 7]);
        assert(q1 == 7);
        Debug.print("q1 pass");

        // 2
        let q2 = Utils.remove_even([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
        assert(q2 == [1, 3, 5, 7, 9]);
        Debug.print("q2 pass");

        // 3 
        let q3 = Utils.drop([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 3);
        assert (q3 == [4, 5, 6, 7, 8, 9, 10]);
        Debug.print("q3 pass");

        // 4
        // - done

        // 5 - done
        let b = Book.create_book("Principia Mathematica", 999);

        // 6
        // - done

        // 7
        await add_book(b);

        // 8
        let ret = await get_books();
        Debug.print(debug_show(ret));
        Debug.print("All Tests Pass")

    };

}