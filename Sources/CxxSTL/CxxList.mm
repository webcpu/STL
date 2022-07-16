//
//  CxxQueue.mm
//  
//
//  Created by liang on 2022-06-05.
//

#include <iostream>
#include <list>
#include "CxxList.hpp"

using namespace std;

@interface _List()
@property (nonatomic) list<id> l;
@end
    
@implementation _List

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _l = list<id>();
    }
    
    return self;
}

- (void)push_back:(id)value {
    _l.push_back(value);
}

- (void)push_front:(id)value {
    _l.push_front(value);
}

- (id)front {
    if (!self.l.empty()) {
        id value = _l.front();
        return value;
    }
    
    return nil;
}

- (id)back {
    if (!self.l.empty()) {
        id value = _l.back();
        return value;
    }
    
    return nil;
}

- (void)pop_back {
    _l.pop_back();
}

- (void)pop_front {
    _l.pop_front();
}

- (bool)contains:(id)value {
    return (std::find(_l.begin(), _l.end(), value) != _l.end());
}

- (void)erase:(int)index {
    auto &element = *std::next(_l.begin(), index);
    std::erase(_l, element);
}

- (id)nth:(int)index {
    id element = *std::next(_l.begin(), index);
    return element;
}

- (int)count {
    return int(_l.size());
}

- (bool)empty {
    return _l.empty();
}

- (NSString *)description {
    return @"";
}

@end
