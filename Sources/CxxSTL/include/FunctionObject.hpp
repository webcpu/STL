//
//  CxxFunctionObject.hpp
//  
//
//  Created by liang on 2022-06-05.
//

#ifndef CxxFunctionObject_hpp
#define CxxFunctionObject_hpp

#include <stdio.h>
#import <Foundation/Foundation.h>

#ifdef __cplusplus
extern "C" {
#endif

@interface _Function<Any> : NSObject
typedef bool (*CompareCompletion)(Any a, Any b);
@property (nonatomic) CompareCompletion compareCompletion;

- (instancetype)init:(CompareCompletion)completion;

@end

@interface _Function1<KeyType> : NSObject
typedef bool (*MapCompareCompletion)(KeyType a, KeyType b);
@property (nonatomic) MapCompareCompletion compareCompletion;

- (instancetype)init:(MapCompareCompletion)completion;
@end

#ifdef __cplusplus

bool numberStringComparator(id a, id b);
struct Comparator {
    Comparator(const std::function<bool(id, id)> _compare = numberStringComparator)
    :compare(_compare)
    {}
    
    bool operator()(id a, id b) {
        return compare(a, b);
    }
    
    std::function<bool(id, id)> compare;
    _Function* fo = nullptr;
};

struct MapComparator {
    MapComparator(const std::function<bool(id, id)> _compare = numberStringComparator)
    :compare(_compare)
    {}
    
    bool operator()(id lhs, id rhs) {
    //bool operator()(std::pair<id, id>* lhs, std::pair<id, id>* rhs) {
        std::pair<id, id>* l = (__bridge std::pair<id, id>*)lhs; //(__bridge std::pair<id, id> *)lhs;
        std::pair<id, id>* r = (__bridge std::pair<id, id>*)rhs; //(__bridge std::pair<id, id> *)rhs;
        return compare(l->first, r->first);
    }
    
    std::function<bool(id, id)> compare;
    _Function* fo = nullptr;
};

}
#endif
#endif /* CxxFunctionObject_hpp */
