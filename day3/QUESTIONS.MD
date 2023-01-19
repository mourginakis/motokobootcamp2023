1. True or False: the Internet Computer has a unique public key that can be used to verify responses coming from any subnets.
    - True, it's called the the root key and it is the public key of the entire network.
2. True or False: when I realize an update call, the boundary node will participate in the consensus but not during query calls.
    - True, query calls do not go through consensus
3. True or False: I can create a certified variable that will certify the response of the following actor:

```
actor {
    public func hello(name : Text) : async Text {
        return ("hello # name");
    };
}
```

- False, you must certify and store the answer along with the hash in memory so that you can serve it in a query call.