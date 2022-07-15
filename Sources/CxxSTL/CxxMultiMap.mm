//
//  CxxMultiMap.mm
//  
//
//  Created by liang on 2022-07-13.
//

#include <iostream>
#include <map>
#include <functional>
#include "CxxMultiMap.hpp"
#import "STL-Swift.h"

using namespace std;

function<bool(id, id)> multiMapComparator = [](id a, id b) { return numberStringComparator(a, b);};

@interface _MultiMap()
@property (nonatomic) multimap<id, id,decltype(multiMapComparator) > q;
@end

@implementation _MultiMap

- (instancetype)init {
    self = [super init];
    if (self) {
        MapComparator comparator(numberStringComparator);
        auto cmp = [](id a, id b){ return numberStringComparator(a, b);};
        _q = multimap<id, id, decltype(multiMapComparator)>{multiMapComparator};
    }
    return self;
}

- (instancetype)init:(CompareCompletion)f {
    self = [super init];
    
    if (self) {
        _q = multimap<id, id, decltype(multiMapComparator)>{f};
    }
    
    return self;
}

- (void)insert:(NSArray*)pair {
    _q.insert({pair[0], pair[1]});
}

- (void)erase:(NSArray *)pair {
    id key = pair[0];
    id value = pair[1];
    auto result = _q.equal_range(key);
    for(auto it = result.first; it != result.second;) {
        if(it->second == value) {
            it = _q.erase(it);
        } else {
            ++it;
        }
    }
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

- (NSArray* )values {
    NSMutableArray* rs = [[NSMutableArray alloc] init];
    for(const auto& [key, value] : _q) {
        [rs addObject:value];
    }
    return rs;
}

- (bool)contains:(id)key{
    return _q.count(key);
}
//- (id)at:(id)index {
//    return _q[index];
//}

- (NSArray *)equal_range:(id)key {
    NSMutableArray* ks = [[NSMutableArray alloc] init];
    auto result = _q.equal_range(key);
    for(auto it = result.first; it != result.second; ++it) {
        [ks addObject:it->second];
    }
    return ks;
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

- (id)nth:(id)index {
    NSNumber *num = (NSNumber *)index;
    auto &element = *std::next(_q.begin(), [num longValue]);
    return @[element.first, element.second];
}

- (NSString *)description {
    return @"";
}

@end
