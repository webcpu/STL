//
//  CxxQueue.mm
//  
//
//  Created by liang on 2022-06-05.
//

#include <iostream>
#include <deque>
#include "CxxDeque.hpp"

using namespace std;

@interface _Deque()
@property (nonatomic) deque<id> q;
@end
    
@implementation _Deque

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _q = deque<id>();
    }
    
    return self;
}

- (void)push_back:(id)value {
    _q.push_back(value);
}

- (void)push_front:(id)value {
    _q.push_front(value);
}

- (void)insert:(id)value at:(int)idx {
    _q.insert(_q.begin()+idx, value);
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

- (id)at:(int)index {
    return _q.at(index);
}

- (void)update:(id)value at:(int)index {
    _q.at(index) = value;
}

- (void)erase:(int)index {
    _q.erase(next(_q.begin(), index));
}

- (void)pop_back {
    _q.pop_back();
}

- (void)pop_front {
    _q.pop_front();
}

- (bool)contains:(id)value {
    return (std::find(_q.begin(), _q.end(), value) != _q.end());
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
