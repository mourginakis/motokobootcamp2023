import Debug "mo:base/Debug";

Debug.print("hello there!");

Debug.print("this will pass!");
assert 1 == 1;


Debug.print("this will fail!");
assert (1==2);

