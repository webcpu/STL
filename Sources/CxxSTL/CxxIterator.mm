//
//  CxxQueue.mm
//  
//
//  Created by liang on 2022-06-05.
//

#include <iostream>
#include <iterator>
#include "CxxIterator.hpp"

using namespace std;

@interface _Iterator()
@property (nonatomic) id it;
@end
    
@implementation _Iterator

- (instancetype)init:(id)theIterator {
    self = [super init];
    
    if (self) {
        _it = theIterator;
    }
    
    return self;
}

//- (instancetype)begin {
//    return [[_Iterator alloc] init: it.begin()]
//}
//
//- (instancetype)end {
//    return [[_Iterator alloc] init: it.end()]
//}

- (NSString *)description {
    return @"";
//    return [NSString stringWithFormat:@"The queue is [%@]", self.q];
}

@end
