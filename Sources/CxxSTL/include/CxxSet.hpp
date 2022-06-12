//
//  CxxSet.hpp
//  
//
//  Created by liang on 2022-06-05.
//

#ifndef CxxSet_hpp
#define CxxSet_hpp

#include <stdio.h>
#import <Foundation/Foundation.h>
#import "FunctionObject.hpp"
#ifdef __cplusplus
extern "C" {
#endif

@interface _Set<Any> : NSObject
- (instancetype)init:(CompareCompletion)f;
- (void)insert:(id)value;
- (int)count;
- (bool)empty;
- (int)begin;
- (int)end;
- (int)next:(int)index;
- (id)at:(int)index;
- (id)nth:(int)index;
@end

#ifdef __cplusplus
}
#endif
#endif /* CxxSet_hpp */
