//
//  CxxDeque.hpp
//  
//
//  Created by liang on 2022-06-05.
//

#ifndef CxxDeque_hpp
#define CxxDeque_hpp

#include <stdio.h>
#import <Foundation/Foundation.h>
#ifdef __cplusplus
extern "C" {
#endif

@interface _Deque<Any> : NSObject

- (void)push_back:(Any)value;
- (void)push_front:(Any)value;
- (void)insert:(Any)value at:(int)idx;
- (Any)front;
- (Any)back;
- (void)pop_back;
- (void)pop_front;
- (int)count;
- (bool)empty;
@end

#ifdef __cplusplus
}
#endif
#endif /* CxxDeque_hpp */
