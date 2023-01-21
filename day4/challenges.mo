import List "mo:base/List";
import Bool "mo:base/Bool";
import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Buffer "mo:base/Buffer";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Iter "mo:base/Iter";

actor {

	/*
		1. Write a function unique that takes a list l of type List and returns
		a new list with all duplicate elements removed.

		unique<T> : (l : List<T>, equal : (T,T) -> Bool) -> List<T>
	*/
	func unique<T> (l : List.List<T>, equal : (T, T) -> Bool) : List.List<T> {
		var unique_list : List.List<T> = List.nil<T>();

		for (item: T in List.toIter<T>(l)) {
			if (not List.some<T>(unique_list, func(x : T) {equal(x, item)})) {
				unique_list := List.push<T>(item, unique_list);
			};
		};
		return unique_list;
	};

	public query func test_unique (l : List.List<Nat>) : async List.List<Nat> {
		return unique<Nat>(l, func (x,y){ x == y});
	};


	/*
		2. Write a function reverse that takes l of type List and returns the
		   reversed list.
		
		reverse<T> : (l : List<T>) -> List<T>;
	*/
	func reverse<T> (l : List.List<T>) : List.List<T> {
		return List.reverse(l);
	};

	public query func test_reverse (l : List.List<Nat>) : async List.List<Nat> {
		return reverse<Nat>(l);
	};


	/*
		3. Write a function is_anonymous that takes no arguments but returns a 
		   Boolean indicating if the caller is anonymous or not.

		is_anynomous : () -> async Bool; 
	*/
	public shared ({ caller }) func is_anonymous() : async Bool {
		return Principal.isAnonymous(caller);
	};


	/*
		4. Write a function find_in_buffer that takes two arguments, buf of 
		   type Buffer and val of type T, and returns the optional index of
		   the first occurrence of "val" in "buf".

		find_in_buffer<T> :  (buf: Buffer.Buffer<T>, val: T, equal: (T,T) -> Bool) -> ?Nat
	*/
	func find_in_buffer<T> (buf : Buffer.Buffer<T>, val: T, equal : (T, T) -> Bool) : ?Nat {
		return Buffer.indexOf<T>(val, buf, equal);
	};

	public func test_find_in_buffer (array : [Nat], val: Nat) : async ?Nat {
		return find_in_buffer<Nat>(Buffer.fromArray(array), val, func (x, y){x == y});
	};


	/*
		5. Add a function called get_usernames that will return an array of
		   tuples (Principal, Text) which contains all the entries in usernames.

		get_usernames : () -> async [(Principal, Text)];
	*/
	let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);

    public shared ({ caller }) func add_username(name : Text) : async () {
    	usernames.put(caller, name);
    };

	public query func get_usernames () : async [(Principal, Text)] {
		let usernamesIter : Iter.Iter<(Principal, Text)> = usernames.entries();
		let usernamesArray : [(Principal, Text)] = Iter.toArray(usernamesIter);
		return usernamesArray;
	};

};