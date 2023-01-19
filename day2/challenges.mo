import Iter "mo:base/Iter";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Array "mo:base/Array";
import Char "mo:base/Char";
import Text "mo:base/Text";
import Buffer "mo:base/Buffer";
import List "mo:base/List";


actor {

//1. Write a function average_array that takes an array of integers and returns the average value of the elements in the array.
	//average_array(array : [Int]) -> async Int.

	public query func average_array(array: [Int]) : async Int {
		var sum: Int = 0;
		for (value in array.vals()) {
			sum += value;
		};
		return(sum / array.size());
	};


//2. Character count: Write a function that takes in a string and a character, and returns the number of occurrences of that character in the string.
	//count_character(t : Text, c : Char) -> async Nat

	public query func count_character(t: Text, c: Char) : async Nat {
		var count: Nat = 0;
		for (char in t.chars()) {
			if (char == c) {
				count += 1;
			};
		};
		return count;
	};


//3. Write a function factorial that takes a natural number n and returns the factorial of n.
	//factorial(n : Nat) ->  async Nat

	public query func factorial(n: Nat) : async Nat {
		var value: Nat = 1;
		for (i in Iter.range(1, n)) {
			value *= i;
		};
		return value;
	};


//4. Write a function number_of_words that takes a sentence and returns the number of words in the sentence.
	//number_of_words(t : Text) -> async Nat 

	public query func number_of_words(t: Text) : async Nat {
		var count: Nat = 0;
		let words = Text.split(t, #char ' ');
		Iter.iterate<Text>(words, func(x, _index) {
			count += 1;
		});
		return count;
	};


//5. Write a function find_duplicates that takes an array of natural numbers and returns a new array containing all duplicate numbers. The order of the elements in the returned array should be the same as the order of the first occurrence in the input array.
	//find_duplicates(a : [Nat]) -> async [Nat]

	public query func find_duplicates(a: [Nat]) : async [Nat] {
		let buffer = Buffer.Buffer<Nat>(1);
		let unique = Buffer.Buffer<Nat>(1);

		for (i in a.vals()) {
			if (Buffer.contains<Nat>(unique, i, Nat.equal) == false) {
				unique.add(i);
			};
		};

		for (i in unique.vals()) {
			var count: Nat = 0;
			for (j in a.vals()) {
				if (i == j) {
					count += 1;
				};
			};
			if (count > 1) {
				buffer.add(i);
			};
		};

		return Buffer.toArray(buffer);
	};


//6. Write a function convert_to_binary that takes a natural number n and returns a string representing the binary representation of n.
	//convert_to_binary(n : Nat) -> async Text

	public query func convert_to_binary(n: Nat) : async Text {
		var binary: Text = "";
		var bits = List.nil<Nat>();
		var quotient: Nat = n;

		while (quotient > 0) {
			var r: Nat = quotient % 2;
			quotient /= 2;
			bits := List.push(r, bits);
		};

		for (value in List.toArray(bits).vals()) {
			binary #= Nat.toText(value);
		};
		
		return binary;
	};

};