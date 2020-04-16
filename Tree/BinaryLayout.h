//
//  BinaryLayout.h
//  Tree
//
//  Created by Ruslan on 4/15/20.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BinaryLayout : UICollectionViewLayout

@property (nonatomic, assign) NSUInteger treeHeight;

@property (nonatomic, assign) CGFloat cellWidth;
@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, assign) CGFloat verticalSpacing;
@property (nonatomic, assign) CGFloat horizontalSpacing;

@end

NS_ASSUME_NONNULL_END
