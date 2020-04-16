//
//  Node.h
//  Tree
//
//  Created by Ruslan on 4/16/20.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node: NSObject

+ (instancetype)nodeWithNumber:(NSNumber *)number;
- (instancetype)initWithNumber:(NSNumber *)number;

- (NSArray<Node *> *)children;

@property (nonatomic, retain) NSNumber *number;

@property (nonatomic, retain) Node *left;
@property (nonatomic, retain) Node *right;

@end

NS_ASSUME_NONNULL_END
