# Dangling Pointer Issue with nonatomic, strong Properties in Objective-C

This repository demonstrates a common and subtle bug in Objective-C related to memory management using `nonatomic, strong` properties.  The bug arises when a property retains a reference to an object that is later deallocated, leading to a dangling pointer.

The `bug.m` file contains the problematic code. The `bugSolution.m` file illustrates a solution to mitigate this problem.

## Problem
When a `nonatomic, strong` property is assigned a value, the property retains the object. If the object is later deallocated, the property still holds a reference to a deallocated object, resulting in a dangling pointer. This can lead to crashes or undefined behavior.  The issue is often difficult to detect because it may not manifest immediately.