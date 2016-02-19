//
//  MainCollectionViewController.m
//  AnimatTutorialsOC
//
//  Created by JiaLi on 16/2/18.
//  Copyright © 2016年 JiaLi. All rights reserved.
//

#import "MainCollectionViewController.h"
#import "MainCollectionViewCell.h"
#import "SimpleAnimatViewController.h"

@interface MainCollectionViewController ()

@end

@implementation MainCollectionViewController

static NSString * const reuseIdentifier = @"MainCollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[MainCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    UIImageView* bg =  [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    bg.image = [UIImage imageNamed:@"launchscreen.png"];
    self.collectionView.backgroundView = bg;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
   MainCollectionViewCell *cell = (MainCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MainCollectionViewCell" forIndexPath:indexPath];
    // Configure the cell
    if (!cell) {
        cell = [[MainCollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, 128, 128)];
    }
    
    //图片名称
    NSInteger r = indexPath.row;
    NSString *imageToLoad = r == 0 ? [NSString stringWithFormat:@"%@.png", @"egg_0"] : [NSString stringWithFormat:@"%@.png", @"chick_3"];
    //加载图片
    cell.imageview.image = [UIImage imageNamed:imageToLoad];
     return cell;
}

#pragma mark <UICollectionViewDelegate>

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(128, 128);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/


// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger r = indexPath.row;
    if (r == 0) {
        SimpleAnimatViewController* simple = [[SimpleAnimatViewController alloc] initWithNibName:@"SimpleAnimatViewController" bundle:nil];
        [self.navigationController pushViewController:simple animated:YES];
        //[self presentViewController:simple animated:YES completion:^{}];
    }
}
/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
