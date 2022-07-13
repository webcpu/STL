//
//  CxxMap.mm
//  
//
//  Created by liang on 2022-06-05.
//

#include <iostream>
#include <map>
#include <functional>
#include "CxxMap.hpp"
#import "STL-Swift.h"

using namespace std;

function<bool(id, id)> mapComparator = [](id a, id b) { return numberStringComparator(a, b);};

@interface _Map()
@property (nonatomic) map<id, id,decltype(mapComparator) > q;
@end

@implementation _Map

- (instancetype)init {
    self = [super init];
    if (self) {
        MapComparator comparator(numberStringComparator);
        auto cmp = [](id a, id b){ return numberStringComparator(a, b);};
        _q = map<id, id, decltype(mapComparator)>{mapComparator};
    }
    return self;
}

- (instancetype)init:(CompareCompletion)f {
    self = [super init];
    
    if (self) {
        _q = map<id, id, decltype(mapComparator)>{f};
    }
    
    return self;
}


- (void)insert:(NSArray*)pair {
    _q.insert({pair[0], pair[1]});
}

- (int)count {
    return int(_q.size());
}

- (bool)empty {
    return _q.empty();
}

- (NSArray* )keys {
    NSMutableArray* ks = [[NSMutableArray alloc] init];
    for(const auto& [key, value] : _q) {
        [ks addObject:key];
    }
    return ks;
}

- (id)at:(id)index {
    return _q.at(index);
}

- (int)begin {
    return 0;
}

- (int)end {
    return int(std::distance(_q.begin(), _q.end()));
}

- (int)next:(int)index {
//    NSNumber *num = (NSNumber *)index;
    auto itr = _q.begin();
    std::advance(itr, index + 1);
    if (itr == _q.end()) {
        return [self end];
    } else {
        return index + 1;
    }
}

- (id)nth:(id)index {
    NSNumber *num = (NSNumber *)index;
    auto &element = *std::next(_q.begin(), [num longValue]);
    return @[element.first, element.second];
}

- (NSString *)description {
    return @"";
}

@end
