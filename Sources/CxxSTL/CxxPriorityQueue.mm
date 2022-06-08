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

bool numberComparator(id a, id b) {
    NSNumber *a1 = static_cast<NSNumber *>(a);
    NSNumber *b1 = static_cast<NSNumber *>(b);
    return [a1 isGreaterThan:b1];
}

bool stringComparator(id a, id b) {
    NSString *a1 = static_cast<NSString *>(a);
    NSString *b1 = static_cast<NSString *>(b);
    NSComparisonResult r = [a1 compare:b1];
    if (r == NSOrderedAscending) {
        return true;
    } else {
        return false;
    }
}

bool numberStringComparator(id a, id b) {
    if ([a isMemberOfClass:[NSNumber class]]) {
        return numberComparator(a, b);
    } else {
        return stringComparator(a, b);
    }
}

struct Comparator {
    Comparator(const function<bool(id, id)> _compare = numberStringComparator)
    :compare(_compare)
    {}
    
    bool operator()(id a, id b) {
        return compare(a, b);
    }
    
    function<bool(id, id)> compare;
    FunctionObject* fo = nullptr;
};

@interface _Function()
@end

@implementation _Function
- (instancetype)init:(CompareCompletion)completion {
    self = [super init];
    
    if (self) {
        _compareCompletion = completion;
    }
    
    return self;
}
@end

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
    return _q.size();
}

- (bool)empty {
    return _q.empty();
}

- (NSString *)description {
    return @"";
}

@end
