//
//  CxxPriorityQueue.mm
//  
//
//  Created by liang on 2022-06-05.
//

#include <iostream>
#include <queue>
#include <functional>
#include "CxxPriorityQueue.hpp"
#import "STL-Swift.h"

using namespace std;

@interface _PriorityQueue()
@property (nonatomic) priority_queue<id, vector<id>, Comparator> q;
@end

@implementation _PriorityQueue

- (instancetype)init {
    self = [super init];
    if (self) {
        Comparator comparator(numberStringComparator);
        _q = priority_queue<id, vector<id>, Comparator>(comparator);
        
    }
    return self;
}

- (instancetype)init:(_Function *)fo {
    self = [super init];
    
    if (self) {
        Comparator comparator([fo compareCompletion]);
        _q = priority_queue<id, vector<id>, Comparator>(comparator);
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
    return int(_q.size());
}

- (bool)empty {
    return _q.empty();
}

- (NSString *)description {
    return @"";
}

@end
