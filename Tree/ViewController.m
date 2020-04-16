//
//  ViewController.m
//  Tree
//
//  Created by Ruslan on 4/15/20.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "BinaryLayout.h"
#import "BalancedTree.h"
#import "Node.h"

static NSString *kCellId = @"CollectionViewCell";

@interface ViewController () <UICollectionViewDataSource>
@property (nonatomic, retain) IBOutlet UICollectionView *collectionView;
@property (nonatomic, retain) IBOutlet UITextField *textField;
@property(nonatomic, retain) BalancedTree *tree;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureCollection];
    [self configureTextField];
    
    NSArray *initialNumbers = @[@50, @21, @2, @44];
    self.tree = [BalancedTree threeWithArray:initialNumbers];

}

#pragma mark - Private

-(void)configureCollection {
    self.collectionView.dataSource = self;
    
    [self.collectionView registerNib: [UINib nibWithNibName:NSStringFromClass([CollectionViewCell class]) bundle:nil]  forCellWithReuseIdentifier:kCellId];
    
    [self reloadLayoutAndData];
    
}

- (void)reloadLayoutAndData {
    BinaryLayout *layout = (BinaryLayout*)self.collectionView.collectionViewLayout;
    layout.treeHeight = [self.tree height];
    layout.cellHeight = 20;
    layout.cellWidth = 20;
    [layout invalidateLayout];
    [self.collectionView reloadData];
}

-(void)configureTextField {
    self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.textField.placeholder = @"Node to add";
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStyleDone target:self action:@selector(addNumber)];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIToolbar *bar = [[UIToolbar alloc] initWithFrame:(CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 50))];
    bar.items = @[spacer, item];
    
    [spacer release];
    [item release];
    
    self.textField.inputAccessoryView = bar;
    [bar release];
}

#pragma mark - Actions

- (IBAction)clearButtonAction:(id)sender {
    
}

-(IBAction)isBSTButtonAction:(id)sender {
    
}

- (void)addNumber {
    if (self.textField.text.length > 0) {
        NSInteger num = self.textField.text.integerValue;
        //[self.tree addNumber:[NSNumber numberWithInteger:num]];
        [self reloadLayoutAndData];
        
        self.textField.text = nil;
        [self.view endEditing:YES];
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.tree nodesCount];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
    Node *node = [self.tree nodeAtIndex:indexPath.row];
    cell.label.text = [NSString stringWithFormat:@"%ld", (long)node.number.intValue];
    return cell;
}

@end
