//
//  BalancedTree.h
//  Tree
//
//  Created by Ruslan on 4/16/20.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Node;

@interface BalancedTree : NSObject

+ (instancetype)threeWithArray:(NSNumber *)numbers;
- (instancetype)initWithArray:(NSArray<NSNumber *> *)numbers NS_DESIGNATED_INITIALIZER;

- (NSUInteger)nodesCount;
- (Node *)nodeAtIndex:(NSUInteger)index;
- (NSUInteger)height;

@end

NS_ASSUME_NONNULL_END
