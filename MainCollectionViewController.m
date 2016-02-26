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
#import "TransformKeyFrameViewController.h"
#import "TransitionsViewController.h"
#import "SpringViewController.h"
#import "TransformViewController.h"
#define SIZEHEIGHT 96.0
#define INDEX_OF_UIVIEW 0
#define INDEX_OF_SPRING 1
#define INDEX_OF_TRANSITION 2
#define INDEX_OF_TRANSFORM 3
@interface MainCollectionViewController ()
@property (strong, nonatomic) NSMutableArray *titleArray;

@end

@implementation MainCollectionViewController

static NSString * const reuseIdentifier = @"MainCollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleArray = [[NSMutableArray alloc] init];

    [_titleArray addObject:[NSString stringWithFormat:@"%@", @"UIView Animation"]];
    [_titleArray addObject:[NSString stringWithFormat:@"%@", @"Spring"]];
    [_titleArray addObject:[NSString stringWithFormat:@"%@", @"Transition"]];
    [_titleArray addObject:[NSString stringWithFormat:@"%@", @"Keyframe"]];
    [_titleArray addObject:[NSString stringWithFormat:@"%@", @"Transform"]];
    

    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[MainCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
     // Do any additional setup after loading the view.
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bggrid"]];
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
    return [_titleArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
   MainCollectionViewCell *cell = (MainCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MainCollectionViewCell" forIndexPath:indexPath];
    // Configure the cell
    if (!cell) {
        cell = [[MainCollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, SIZEHEIGHT, SIZEHEIGHT)];
    }
    
    cell.layer.borderWidth = 1.0;
    cell.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.75];
    cell.layer.cornerRadius = 5.0;
    //cell.layer.masksToBounds = YES;
    cell.clipsToBounds = NO;
    cell.layer.borderColor = [[UIColor whiteColor] CGColor];
    cell.layer.shadowColor = [[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5] CGColor];
    cell.layer.shadowOffset = CGSizeMake(30, 30);
    
    NSInteger r = indexPath.row;
    if (r < [_titleArray count]) {
        cell.textLabel.text = [_titleArray objectAtIndex:r];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
     return cell;
}

#pragma mark <UICollectionViewDelegate>

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SIZEHEIGHT, SIZEHEIGHT);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
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
    UIViewController* subViewController = nil;
    switch (r) {
        case 0: {
            subViewController = [[SimpleAnimatViewController alloc] initWithNibName:@"SimpleAnimatViewController" bundle:nil];
              break;
        }
        case 1:
            subViewController = [[SpringViewController alloc] initWithNibName:@"SpringViewController" bundle:nil];
            break;
        case 2:
            subViewController = [[TransitionsViewController alloc] initWithNibName:@"TransitionsViewController" bundle:nil];
            break;
        case 3: {
            subViewController = [[TransformKeyFrameViewController alloc] initWithNibName:@"TransformKeyFrameViewController" bundle:nil];
        }
            break;
        case 4: {
            subViewController = [[TransformViewController alloc] initWithNibName:@"TransformViewController" bundle:nil];
        }
            break;
  
        default:
            break;
    }

    if (subViewController != nil) {
        subViewController.title = [_titleArray objectAtIndex:r];

        [self.navigationController pushViewController:subViewController animated:YES];
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
