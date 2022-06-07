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

//#import <Foundation/Foundation.h>

using namespace std;

bool numberComparator(id a, id b) {
    NSNumber *a1 = static_cast<NSNumber *>(a);
    NSNumber *b1 = static_cast<NSNumber *>(b);
    return a1.intValue < b1.intValue;
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


struct CompareHeight {
    CompareHeight(const function<bool(id, id)> _compare = numberStringComparator)
    :compare(_compare)
    {}
    
    bool operator()(id a, id b) {
        return compare(a, b);
    }
    
    function<bool(id, id)> compare;
    FunctionObject* fo = nullptr;
};

@interface _Function()
//@property (nonatomic) priority_queue<id, vector<id>, CompareHeight> q;
@end

@implementation _Function
- (instancetype)init:(CompareCompletion)completion {
    self = [super init];
    
    if (self) {
//        function<bool(id, id)> compare = [](id a, id b) {
//            if ([a isMemberOfClass:[NSNumber class]]) {
//                return numberComparator(a, b);
//            } else {
//                return stringComparator(a, b);
//            }
//        };
        _compareCompletion = completion;
        
//        CompareHeight ch(compare);
//        _q = priority_queue<id, vector<id>, CompareHeight>(ch);
    }
    
    return self;
}
@end

@interface _PriorityQueue()
@property (nonatomic) priority_queue<id, vector<id>, CompareHeight> q;
@end

@implementation _PriorityQueue

//- (instancetype)init {
//    self = [super init];
//
//    if (self) {
////        auto compare = [](auto a, auto b){ return a < b;};
////        _q = priority_queue<id, vector<id>, compare>();
////        cout << id << endl;
//        _q = priority_queue<id>();
//    }
//
//    return self;
//}

- (instancetype)init {
    self = [super init];
    if (self) {
        _compareCompletion = numberStringComparator;
        CompareHeight ch(_compareCompletion);
        _q = priority_queue<id, vector<id>, CompareHeight>(ch);
        
    }
    return self;
}

- (instancetype)init:(_Function *)fo {
    //- (instancetype)init:(CompareCompletion)completion {
    self = [super init];
    
    if (self) {
        function<bool(id, id)> compare = [](id a, id b) {
            if ([a isMemberOfClass:[NSNumber class]]) {
                return numberComparator(a, b);
            } else {
                return stringComparator(a, b);
            }
        };
        _compareCompletion = [fo compareCompletion];
        
        //        CompareHeight ch(compare);
        CompareHeight ch(_compareCompletion);
        _q = priority_queue<id, vector<id>, CompareHeight>(ch);
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
