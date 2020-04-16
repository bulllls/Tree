//
//  BalancedTree.m
//  Tree
//
//  Created by Ruslan on 4/16/20.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

#import "BalancedTree.h"
#import "Node.h"

@interface BalancedTree ()
@property (nonatomic, retain) Node *root;
@property (nonatomic, retain) NSMutableArray<Node *> *allNodes;
@end

@implementation BalancedTree

+ (instancetype)threeWithArray:(NSArray<NSNumber *> *)numbers {
    return [[[self alloc] initWithArray:numbers] autorelease];
}

- (instancetype)initWithArray:(NSArray<NSNumber *> *)numbers {
    self = [super init];
    if (self) {
        _allNodes = [[NSMutableArray alloc] initWithCapacity:numbers.count];
        for (NSNumber *num in numbers) {
            [self addNumder:num];
        }
    }
    return self;
}

- (instancetype)init {
    return [self initWithArray:@[]];
}

- (void)dealloc {
    NSLog(@"%s %@", __PRETTY_FUNCTION__, self);
    
    [_allNodes release];
    _allNodes = nil;
    
    [_root release];
    _root = nil;
    
    [super dealloc];
}

#pragma mark - Calculation

- (void)addNumder:(NSNumber *)number{
    Node *node = [Node nodeWithNumber:number];
    [self.allNodes addObject:node];
    [self addNode:node];
    
}

- (void)addNode:(Node *)node {
    if (self.root == nil) {
        self.root = node;
    } else if (self.root.left == nil) {
        self.root.left = node;
    } else if (self.root.right == nil) {
        self.root.right = node;
    } else {
        BOOL added = NO;
        NSArray<Node *> *children = self.root.children;
        
        while (added == NO) {
            added = [self addNode:node toChildren:children];
            if (added == NO) {
                NSMutableArray *newChildren = [NSMutableArray arrayWithCapacity:children.count*2];
                for (Node *child in children) {
                    [newChildren addObjectsFromArray:child.children];
                }
                children = newChildren;
            }
        }
    }
}

- (BOOL)addNode:(Node *)node toChildren:(NSArray<Node *> *)children {
    for (Node *enumeratedNode in children) {
        if (enumeratedNode.left == nil) {
            enumeratedNode.left = node;
            return YES;
        } else if (enumeratedNode.right == nil) {
            enumeratedNode.right = node;
            return YES;
        }
    }
    return NO;
}

- (NSUInteger)nodesCount {
    return self.allNodes.count;
}

- (Node *)nodeAtIndex:(NSUInteger)index {
    if (index < self.allNodes.count) {
        return self.allNodes[index];
    } else {
        return nil;
    }
}

- (NSUInteger)height {
    NSUInteger height = 0;
    NSUInteger count = [self nodesCount];
    while (pow(2, height) < count) {
        height += 1;
    }
    return height;
}

@end
