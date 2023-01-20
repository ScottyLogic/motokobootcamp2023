import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Int "mo:base/Int";

module Utils {

/*
   1. In your file called utils.mo: create a function called second_maximum
   that takes an array [Int] of integers and returns the second largest number
   in the array.
*/
	public func second_maximum(array: [Int]) : Int {
		if (array.size() == 1) {
			return array[0];
		};
		return Array.sort<Int>(array, Int.compare)[array.size() - 2];
	};

/*
	2. In your file called utils.mo: create a function called remove_even that
	takes an array [Nat] and returns a new array with only the odd numbers from
	the original array.
*/
	public func remove_even(array: [Nat]) : [Nat] {
		return Array.filter<Nat>(array, func x = x % 2 != 0);
	};

/*
	3. In your file called utils.mo: write a function drop that takes 2 
	parameters: an array [T] and a Nat n. This function will drop the n first 
	elements of the array and returns the remainder. ⛔️ Do not use a loop.
*/
	public func drop<T> (xs: [T], n: Nat) : [T] {
		return Array.tabulate<T>(xs.size()-n, func i = xs[i + n]);
	};

};