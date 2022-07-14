//
//  CxxForwardList.hpp
//  
//
//  Created by liang on 2022-06-05.
//

#ifndef CxxForwardList_hpp
#define CxxForwardList_hpp

#include <stdio.h>
#import <Foundation/Foundation.h>
#ifdef __cplusplus
extern "C" {
#endif

@interface _ForwardList<Any> : NSObject

- (void)push_front:(Any)value;
- (Any)front;
- (void)pop_front;
- (bool)empty;
- (bool)contains:(id)value;
@end

#ifdef __cplusplus
}
#endif
#endif /* CxxForwardList_hpp */
