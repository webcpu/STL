//
//  CxxStack.mm
//  
//
//  Created by liang on 2022-06-05.
//

#include <iostream>
#include <stack>
#include "CxxStack.hpp"

using namespace std;

@interface _Stack()
@property (nonatomic) stack<id> q;
@end
    
@implementation _Stack

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _q = stack<id>();
    }
    
    return self;
}

- (void)push:(id)value {
    _q.push(value);
}

- (void)pop {
    _q.pop();
}

- (id)top {
    if (!self.q.empty()) {
        id value = _q.top();
        return value;
    }
    
    return nil;
}

- (int)count {
    return _q.size();
}

- (bool)empty {
    return _q.empty();
}

- (NSString *)description {
    return @"";
}

@end
