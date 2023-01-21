1. True or False: we can prevent the heap being erased during upgrades by using a stable heap.
- False, the heap gets erased but we can use the stable memory to store a stable var.
2. A.call() -> B.call() -> C How much time (or rounds of consensus) do we need to wait for an answer?
- two functions are called, so we must wait for 2 rounds of consensus if the canisters are in the same subnet, or 4 if they are in different subnets.
3. Is possible to realize an intercanister call in query mode?
- no, they must go through consensus (update call)