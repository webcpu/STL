//
//  CxxQueue.mm
//  
//
//  Created by liang on 2022-06-05.
//

#include <iostream>
#include <queue>
#include "CxxQueue.hpp"

using namespace std;

@interface _Queue()
@property (nonatomic) queue<id> q;
@end
    
@implementation _Queue

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _q = queue<id>();
    }
    
    return self;
}

- (void)push:(id)value {
    _q.push(value);
}

- (void)pop {
    _q.pop();
}

- (id)front {
    if (!self.q.empty()) {
        id value = _q.front();
        return value;
    }
    
    return nil;
}

- (id)back {
    if (!self.q.empty()) {
        id value = _q.back();
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
