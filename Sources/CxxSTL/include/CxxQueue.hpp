//
//  CxxRegex.hpp
//  
//
//  Created by liang on 2022-06-05.
//

#ifndef CxxQueue_hpp
#define CxxQueue_hpp

#include <stdio.h>
#import <Foundation/Foundation.h>
#ifdef __cplusplus
extern "C" {
#endif

@interface _Queue<Any> : NSObject

- (void)push:(Any)value;
- (void)pop;
- (Any)front;
- (Any)back;
- (int)count;
- (bool)empty;
@end

#ifdef __cplusplus
}
#endif
#endif /* CxxQueue_hpp */
