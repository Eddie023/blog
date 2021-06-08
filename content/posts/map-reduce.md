---
title: "Map Reduce"
date: 2021-05-27T19:02:36+05:45
draft: false
---

### Paper: MapReduce: Simplified Data Processing on Large Clusters

Abstract:
Users specify a man function that process a key/value pair to generate a set of intermediate key/value pairs, and a reduce function that merges all intermediate values associated with the same intermediate key.
Many real world task are expressed in this model.

The run time system is responsible for partitioning the input data, scheduling the program's execution across a set of machines, handling machines failures, and managing the required inter-machine communication. This allows programmers without any experience with distributed systems to easily utilize the resources of large distributed system.

Introduction:
Even though some of the problems of processing large set of data are straightforward. However, when computation have to be distributed across hundreds or thousands of machines to complete in a reasonable time makes the problem extremely challenging. Aurthor of this paper came up with an abstraction that allowed the simple computation by hiding the messy details of parallelization, fault-tolerane, data distribution and load balancing in a library.
- Abstraction was inspired by map, reduce primitives of Lisp and other functional languages.
- Map operation is applied to each logical "record" of input in order to compute a set of intermediate key/value pairs.
- Reduce operation was then applied to combine all the derived data appropriately.
- Main advantage of this approach was that authors were able to use a simple, commodity Pcs to compute a smaller chunk of data

Programming Model
The computation takes a set of input key/value pair and produces a set of output key/value pairs.

The intermediate values are supplied to the user's reduce function via an iterator. This allowed to handled lists of values that are too large to fit in memory.

Example:
Problem: Count the number of occurrences of each word in a large collection of documents.

Pseudo-code:
map(string key, string value):
	for each word w in value:
		EmitIntermediate(w, "1");

reduce(string key, iterator values):
	int result = 0
	for each v in values:
		result += parseInt(v)
	Emit(AsString(result));

The map func emits each word plus an associated count of occurrences
The reduce func sums together all counts emitted for a particular word

The user writes code to fill in a mapreduce specification object with the names of the input and output files, and optional tuning parameters.

