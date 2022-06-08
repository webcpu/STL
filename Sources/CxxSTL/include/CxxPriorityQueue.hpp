//
//  CxxPriorityQueue.hpp
//  
//
//  Created by liang on 2022-06-05.
//

#ifndef CxxPriorityQueue_hpp
#define CxxPriorityQueue_hpp

#include <stdio.h>
#import <Foundation/Foundation.h>
#ifdef __cplusplus
extern "C" {
#endif

//class FunctionObject {
//    var compare: (Any, Any) -> Bool = { (a, b) in
//        let lhs: Int = a as! Int
//        let rhs: Int = b as! Int
//        return lhs < rhs
//    }
//}

@interface _Function<Any> : NSObject
typedef bool (*CompareCompletion)(Any a, Any b);
@property (nonatomic) CompareCompletion compareCompletion;

- (instancetype)init:(CompareCompletion)completion;

@end

@interface _PriorityQueue<Any> : NSObject
typedef bool (*CompareCompletion)(Any a, Any b);

//@property (nonatomic) CompareCompletion compareCompletion;
//- (instancetype)init:(CompareCompletion)completion;
- (instancetype)init:(_Function *)fo;

- (void)push:(Any)value;
- (void)pop;
- (Any)top;
- (int)count;
- (bool)empty;
@end

#ifdef __cplusplus
}
#endif
#endif /* CxxPriorityQueue_hpp */
