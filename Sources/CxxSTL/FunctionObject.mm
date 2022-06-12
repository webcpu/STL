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
#include "FunctionObject.hpp"
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

@interface _Function1()
@end

@implementation _Function1
- (instancetype)init:(CompareCompletion)completion {
    self = [super init];
    
    if (self) {
        _compareCompletion = completion;
    }
    
    return self;
}
@end
