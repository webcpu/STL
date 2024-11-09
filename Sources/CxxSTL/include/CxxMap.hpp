//
//  CxxMap.hpp
//  
//
//  Created by liang on 2022-06-05.
//

#ifndef CxxMap_hpp
#define CxxMap_hpp

#include <stdio.h>
#import <Foundation/Foundation.h>
#import "FunctionObject.hpp"
#ifdef __cplusplus
extern "C" {
#endif

//@interface _Map<Any, Any1> : NSObject
@interface _Map<__covariant KeyType, __covariant ValueType> : NSObject
//typedef bool (*CompareCompletion)(KeyType a, KeyType b);
//- (instancetype)init:(_Function *)fo;
- (instancetype)init:(CompareCompletion)f;
- (void)insert:(NSArray *)pair;
- (void)erase:(id)key;
- (bool)contains:(id)key;
- (int)count;
- (bool)empty;
- (int)begin;
- (int)end;
- (int)next:(int)index;
- (NSArray* )keys;
- (NSArray* )values;
- (id)at:(id)index;
- (NSArray* )nth:(id)index;
@end

#ifdef __cplusplus
}
#endif
#endif /* CxxMap_hpp */
