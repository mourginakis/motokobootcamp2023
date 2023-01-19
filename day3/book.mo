module {

    /// 4 
    /// custom type with at least 2 properties
    /// (title of type Text, pages of type Nat)
    public type Book = {
        title: Text;
        pages: Nat
    };


    /// 5
    /// takes two parameters: a title of type Text, 
    /// and a number of pages of type Nat
    // returns a book
    public func create_book(title: Text, num_pages : Nat) : Book {
        let book : Book = {
            title;
            pages = num_pages;
        };
        book
    }
}