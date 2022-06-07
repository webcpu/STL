//
//  CxxStack.hpp
//  
//
//  Created by liang on 2022-06-05.
//

#ifndef CxxStack_hpp
#define CxxStack_hpp

#include <stdio.h>
#import <Foundation/Foundation.h>
#ifdef __cplusplus
extern "C" {
#endif

@interface _Stack<Any> : NSObject

- (void)push:(Any)value;
- (void)pop;
- (Any)top;
- (int)count;
- (bool)empty;
@end

#ifdef __cplusplus
}
#endif
#endif /* CxxStack_hpp */
