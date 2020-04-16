//
//  Node.m
//  Tree
//
//  Created by Ruslan on 4/16/20.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

#import "Node.h"

@implementation Node

+ (instancetype)nodeWithNumber:(NSNumber *)number {
    return [[[self alloc] initWithNumber:number] autorelease];
}

- (instancetype)initWithNumber:(NSNumber *)number {
    self = [super init];
    if (self) {
        _number = [number retain];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%d", self.number.intValue];
}

- (void)dealloc {
    NSLog(@"%s %@", __PRETTY_FUNCTION__, self);
    
    [_number release];
    _number = nil;
    
    [_left release];
    _left = nil;
    
    [_right release];
    _right = nil;
    
    [super dealloc];
}

- (NSArray<Node *> *)children {
    NSMutableArray<Node *> *result = [[@[] mutableCopy] autorelease];
    if (self.left != nil) {
        [result addObject:self.left];
    }
    
    if (self.right != nil) {
        [result addObject:self.right];
    }
    return [[result copy] autorelease];
}

@end
