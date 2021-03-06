//
//  CxxQueue.mm
//  
//
//  Created by liang on 2022-06-05.
//

#include <iostream>
#include <forward_list>
#include "CxxForwardList.hpp"

using namespace std;

@interface _ForwardList()
@property (nonatomic) forward_list<id> l;
@end
    
@implementation _ForwardList

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _l = forward_list<id>();
    }
    
    return self;
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

- (bool)empty {
    return _l.empty();
}

- (NSString *)description {
    return @"";
}

- (int)count {
    return int(distance(_l.begin(), _l.end()));
}

@end
