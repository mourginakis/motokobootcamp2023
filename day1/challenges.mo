actor {
  public query func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };


  // Coding Challenges

  // 1
  public query func multiply(n : Nat, m : Nat) : async Nat {
    n * m;
  };

  // 2
  public query func volume(n : Nat) : async Nat {
    n * n * n;
  };

  // 3
  public query func hours_to_minutes(n : Nat) : async Nat {
    n * 24;
  };

  // 4
  var counter = 0;

  public func set_counter(n : Nat) : async () {
    counter := n;
  };

  public query func get_counter() : async Nat {
    counter;
  };

  // 5
  public query func test_divide(n : Nat, m : Nat) : async Bool {
    n % m == 0;
  };

  // 6
  public query func is_even(n : Nat) : async Bool {
    n % 2 == 0;
  }


};
