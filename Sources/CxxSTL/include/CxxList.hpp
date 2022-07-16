//
//  CxxList.hpp
//  
//
//  Created by liang on 2022-06-05.
//

#ifndef CxxList_hpp
#define CxxList_hpp

#include <stdio.h>
#import <Foundation/Foundation.h>
#ifdef __cplusplus
extern "C" {
#endif

@interface _List<Any> : NSObject

- (void)push_back:(Any)value;
- (void)push_front:(Any)value;
- (Any)front;
- (Any)back;
- (void)pop_back;
- (void)pop_front;
- (bool)contains:(id)value;
- (void)erase:(int)index;
- (Any)nth:(int)index;
- (int)count;
- (bool)empty;
@end

#ifdef __cplusplus
}
#endif
#endif /* CxxList_hpp */
