//
//  CxxSet.mm
//  
//
//  Created by liang on 2022-06-05.
//

#include <iostream>
#include <set>
#include <functional>
#include "CxxSet.hpp"
#import "STL-Swift.h"

using namespace std;

function<bool(id, id)> setComparator = [](id a, id b) { return numberStringComparator(a, b);};

@interface _Set()
@property (nonatomic) set<id,decltype(setComparator) > q;
@property (nonatomic) CompareCompletion compareFunction;
@end

@implementation _Set

- (instancetype)init {
    self = [super init];
    if (self) {
        auto cmp = [](id a, id b){ return numberStringComparator(a, b);};
        _compareFunction = cmp; //setComparator;
        _q = set<id, decltype(setComparator)>{setComparator};
    }
    return self;
}

- (instancetype)init:(CompareCompletion)f {
    self = [super init];
    
    if (self) {
        _compareFunction = f;
        _q = set<id, decltype(setComparator)>{f};
    }
    
    return self;
}


- (void)insert:(id)value {
    _q.insert(value);
}

- (bool)contains:(id)elem {
    return _q.count(elem);
}

//- (NSMutableSet *)intersection:(_Set<id> *)set2 {
//    auto s2 = set<id, decltype(setComparator)>{};
//    s2.insert(set2.q.begin(), set2.q.end());
//    auto r = set<id, decltype(setComparator)>{setComparator};
//    NSMutableSet *result = [[NSMutableSet alloc] init];
//    auto last = set_intersection(_q.begin(), _q.end(), s2.begin(), s2.end(), r.begin(), _compareFunction);
//    for(auto it = r.begin(); it != last; ++it) {
//        [result addObject: *it];
//    }
//    return result;
//}

- erase:(id)value{
    _q.erase(value);
}

- (int)count {
    return int(_q.size());
}

- (bool)empty {
    return _q.empty();
}

- (id)at:(int)index {
    auto it = _q.begin();
    std::advance(it, index);
    return *it;
}

- (int)begin {
    return 0;
}

- (int)end {
    return int(std::distance(_q.begin(), _q.end()));
}

- (int)next:(int)index {
    auto itr = _q.begin();
    std::advance(itr, index + 1);
    if (itr == _q.end()) {
        return [self end];
    } else {
        return index + 1;
    }
}

- (id)nth:(int)index {
    auto &element = *std::next(_q.begin(), index);
    return element;
}

- (NSString *)description {
    return @"";
}

@end
