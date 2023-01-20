import Book "book";
import List "mo:base/List"; 	// 6. import the type List . . .

actor {

/*
	4. . . import this type in your main.mo and create a variable that will 
	store a book.
*/
	var a_book = Book.create_book("A Good Book", 10);

/*
	6. . . and create a list that stores books.
*/
	var book_list = List.nil<Book.Book>();

/*
	7. In main.mo create a function called add_book that takes a book as 
	parameter and returns nothing this function should add this book to your 
	list. Then create a second function called get_books that takes no 
	parameter but returns an Array that contains all books stored in the list.
*/
	public func add_book(book: Book.Book) : async () {
		book_list := List.push<Book.Book>(book, book_list);
	};

	public query func get_books() : async [Book.Book] {
		return List.toArray<Book.Book>(book_list);
	};
	
}