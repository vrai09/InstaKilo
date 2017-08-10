//
//  ViewController.m
//  InstaKilo
//
//  Created by Livleen Rai on 2017-08-09.
//  Copyright © 2017 Livleen Rai. All rights reserved.
//

#import "ViewController.h"
#import "Photo.h"
#import "MyCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property UICollectionViewFlowLayout *flowLayout;
@property NSArray *photos;
@property NSMutableDictionary *sortedPhotos;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;


@end

@implementation ViewController
- (IBAction)segmentValueChanged:(UISegmentedControl *)sender {
    switch (_segmentControl.selectedSegmentIndex) {
        case 0:
            [self sortByLocation];
            [self.collectionView reloadData];
            break;
        case 1:
            [self sortBySubject];
            [self.collectionView reloadData];
        default:
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpLayout];
    
    self.photos = @[
                    [[Photo alloc]initWithImage:[UIImage imageNamed:@"images-1"] location:@"California" subject:@"Landscape"],
                    [[Photo alloc]initWithImage:[UIImage imageNamed:@"images-2"] location:@"Vancouver" subject:@"Album Cover"],
                    [[Photo alloc]initWithImage:[UIImage imageNamed:@"images-3"] location:@"Vancouver" subject:@"Landscape"],
                    [[Photo alloc]initWithImage:[UIImage imageNamed:@"images-4"] location:@"California" subject:@"Album Cover"],
                    [[Photo alloc]initWithImage:[UIImage imageNamed:@"imgres-1"] location:@"Vancouver" subject:@"Landscape"],
                    [[Photo alloc]initWithImage:[UIImage imageNamed:@"images"] location:@"California" subject:@"Landscape"]
                    ];
    [self sortByLocation];
    self.collectionView.collectionViewLayout = self.flowLayout;
}

- (void)setUpLayout {
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.itemSize = CGSizeMake(100, 100);
    self.flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.flowLayout.minimumInteritemSpacing = 15;
    self.flowLayout.minimumLineSpacing = 10;
    self.flowLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 50);
}

- (void)sortByLocation {
    
    self.sortedPhotos = [[NSMutableDictionary alloc]init];
    
    for(Photo *photo in self.photos) {
        NSMutableArray *photosAtLocation = self.sortedPhotos[photo.location];
        if(!photosAtLocation) photosAtLocation = [NSMutableArray array];
        [photosAtLocation addObject:photo];
        self.sortedPhotos[photo.location] = photosAtLocation;
    }
}

- (void)sortBySubject {
    
    self.sortedPhotos = [[NSMutableDictionary alloc]init];
    
    for(Photo *photo in self.photos) {
        NSMutableArray *photosWithSubject = self.sortedPhotos[photo.subject];
        if(!photosWithSubject) photosWithSubject = [NSMutableArray array];
        [photosWithSubject addObject:photo];
        self.sortedPhotos[photo.subject] = photosWithSubject;
    }
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sortedPhotos.allKeys.count;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.sortedPhotos[self.sortedPhotos.allKeys[section]]count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    Photo *photo = self.sortedPhotos.allValues[indexPath.section][indexPath.row];
    cell.image = photo.image;
    [cell setUpCell];
    
    return cell;
}



-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        headerView.sectionLabel.text = self.sortedPhotos.allKeys[indexPath.section];
        return headerView;
    }
    return 0;
}

@end
