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
@property (nonatomic) forward_list<id> q;
@end
    
@implementation _ForwardList

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _q = forward_list<id>();
    }
    
    return self;
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

- (void)pop_front {
    _q.pop_front();
}

- (bool)empty {
    return _q.empty();
}

- (NSString *)description {
    return @"";
//    return [NSString stringWithFormat:@"The queue is [%@]", self.q];
}

@end
