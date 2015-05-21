//
//  EKTortureSpec.m
//  EnumeratorKit
//
//  Created by Akshay Venkatesh on 21/05/2015.
//  Copyright 2015 Adam Sharp. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "EnumeratorKit.h"

@interface RandomGenerator : NSObject
+ (NSArray*) arrayofOfRandNos:(NSInteger) count;
@end

@implementation RandomGenerator : NSObject

+ (NSArray *)arrayofOfRandNos:(NSInteger)count
{
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        [arr addObject:@(arc4random_uniform(UINT32_MAX))];
    }
    return arr.copy;
}
@end

SPEC_BEGIN(EKTortureSpec)

describe(@"EKTorture", ^{
    it(@"Should find each element of an array in the same array", ^{
        NSArray *arr = [RandomGenerator arrayofOfRandNos:100];
        for(NSNumber *num in arr) {
            NSObject *found = [arr find:^BOOL(id obj) {
                return [obj isEqual:num];
            }];
            [[found shouldNot] beNil];
        }
    });
});

SPEC_END
