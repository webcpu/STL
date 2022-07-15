//
//  CxxMultiMap.hpp
//  
//
//  Created by liang on 2022-06-05.
//

#ifndef CxxMultiMap_hpp
#define CxxMultiMap_hpp

#include <stdio.h>
#import <Foundation/Foundation.h>
#import "FunctionObject.hpp"
#ifdef __cplusplus
extern "C" {
#endif

@interface _MultiMap<__covariant KeyType, __covariant ValueType> : NSObject
- (instancetype)init:(CompareCompletion)f;
- (void)insert:(NSArray *)pair;
- (int)count;
- (bool)empty;
- (bool)contains:(id)key;
- (int)begin;
- (int)end;
- (int)next:(int)index;
- (void)erase:(NSArray *)pair;
- (NSArray* )keys;
- (NSArray* )values;
- (NSArray* )nth:(id)index;
- (NSArray *)equal_range:(id)key;
@end

#ifdef __cplusplus
}
#endif
#endif /* CxxMultiMap_hpp */
