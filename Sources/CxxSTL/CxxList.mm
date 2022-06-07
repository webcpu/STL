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
@property (nonatomic) list<id> q;
@end
    
@implementation _List

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _q = list<id>();
    }
    
    return self;
}

- (void)push_back:(id)value {
    _q.push_back(value);
}

- (void)push_front:(id)value {
    _q.push_front(value);
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

- (void)pop_back {
    _q.pop_back();
}

- (void)pop_front {
    _q.pop_front();
}

- (int)count {
    return _q.size();
}

- (bool)empty {
    return _q.empty();
}

- (NSString *)description {
    return @"";
//    return [NSString stringWithFormat:@"The queue is [%@]", self.q];
}

@end
