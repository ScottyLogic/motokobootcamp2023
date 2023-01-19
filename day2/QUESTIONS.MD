1. Who controls the ledger canister?

> There is a single ledger canister which runs alongside other canisters on a special subnet of the Internet Computer - the NNS subnet.

> The ledger canister is a smart contract that holds accounts and transactions. 

> An account belongs to and is controlled by the account owner who must be an Internet Computer (IC) principal.

---

2. What is the subnet of the canister with the id: mwrha-maaaa-aaaab-qabqq-cai? How \[many\] nodes are running this subnet?

Subnet ID: pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe<br>
Node Machines: 16

---

3. I have a neuron with 1O ICPs locked with a dissolve delay of 4 years - my neuron has been locked for 2 years. What is my expected voting power?
Voting power is determined by these factors:
- Principal: 1 ICP = 1 Vote
- Lock up duration / Dissolved Delay: 6 months grants a 1.06x voting power bonus, and 8 years grants 2x. All other durations scale linearly between.
- Age / Time locked: 4 years grants a 1.25x bonus, multiplicative with any other bonuses. All other durations between 0 seconds and 4 years scale linearly between.

10 x 1.4986 x 1.125 = 16.85925

Voting Power would be: **16.85925**

---

4. What is wrong with the following code?
```
actor {
  let n : Nat = 50;
  let t : Text = "Hello";

  public func convert_to_text(m : Nat) : async Text {
    Nat.toText(m);
  };
}
```

The two variables, `n` and `t`, are declared but not used.

If you are asking if something is missing, the import for Nat is needed to access the `.toText()` method,
due to 'unbound variable Nat' which leads to a Stderr; 'type error [M0057], unbound variable Nat'
So it needs the following to be added above the actor: `import Nat "mo:base/Nat";`

Also, this function would benefit from adding the `query` keyword.

```
import Nat "mo:base/Nat";
actor {
  public query func convert_to_text(m : Nat) : async Text {
    Nat.toText(m);
  };
}
```

---

5. What is wrong with the following code?
```
actor {
  var languages : [var Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public func show_languages(language : Text) : async [var Text] {
    return (languages);
  };
 
}
```

I get two "PROBLEMS" in vscode:
1. immutable array expression cannot produce expected type
2. shared function has non-shared return type

Removing the keyword `var` from `[var Text]` and `...async [var Text] {` will run the code successfully.

Additionally, if the variable list 'languages' is what is being returned, then there is no need to pass the 'language' argument.
And this is what we are left with:
```
actor {
  var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public func show_languages() : async [Text] {
    return (languages);
  };
}
```

Could also maybe add the keyword `query`,  `public query func show_languages...`

---

6. What is wrong with the following code?
```
actor {
  var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public func add_language(new_language: Text) : async [Text] {
    languages := Array.append<Text>(languages, [new_language]);
    return (languages);
  };
 
}
```

The "PROBLEM" in vscode is saying "unbound variable Array"
Simply adding the import for the Array library will fix it.
```
import Array "mo:base/Array";
```
