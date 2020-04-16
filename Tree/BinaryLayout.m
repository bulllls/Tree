//
//  BinaryLayout.m
//  Tree
//
//  Created by Ruslan on 4/15/20.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

#import "BinaryLayout.h"

@interface BinaryLayout()
@property (nonatomic, retain) NSMutableArray<UICollectionViewLayoutAttributes *> *cache;
@property (nonatomic, assign) CGFloat contentSize;
@end

@implementation BinaryLayout

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    
    if (self) {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        [self commonInit];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    _cache = [[NSMutableArray alloc] initWithCapacity:16];
    
    _treeHeight = 0;
    
    _cellWidth = 50;
    _cellHeight = 50;
    
    _verticalSpacing = 10;
    _horizontalSpacing = 10;
}

- (void)setTreeHeight:(NSUInteger)treeHeight {
    _treeHeight = treeHeight;
    
    [self updateContentSize];
}

- (void)setCellWidth:(CGFloat)cellWidth {
    _cellWidth = MAX(0, cellWidth);
    
    [self updateContentSize];
}

- (void)setCellHeight:(CGFloat)cellHeight {
    _cellHeight = MAX(0, cellHeight);
    
    [self updateContentSize];
}

#pragma mark - UICollectionViewLayout

- (CGSize)collectionViewContentSize {
    return self.contentSize;
}

- (void)invalidateLayout {
    [super invalidateLayout];
    [self.cache removeAllObjects];
}

- (void)prepareLayout {
    if (self.cache.count > 0 || self.collectionView == nil) {
        return;
    }
    
    for (NSUInteger i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        [self.cache addObject:attributes];
        
        NSUInteger row = [self rowForIndex: i];
        
    }
}

@end
