In Objective-C, a common yet subtle issue arises when dealing with memory management, specifically with properties declared using `nonatomic, strong`.  Consider this scenario:

```objectivec
@interface MyClass : NSObject
@property (nonatomic, strong) NSString *myString;
@end

@implementation MyClass
- (void)someMethod {
    self.myString = [NSString stringWithFormat:@"Hello, %@", someVariable];
    // ... some code ...
    // If 'someVariable' becomes nil later, myString will still retain it.
}
```

If `someVariable` is subsequently deallocated or set to `nil`, the `myString` property may retain a dangling pointer to the deallocated object, creating a potential crash or memory corruption.  This is particularly insidious because it often doesn't manifest immediately.