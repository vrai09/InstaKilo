//
//  MyCollectionViewCell.h
//  InstaKilo
//
//  Created by Livleen Rai on 2017-08-09.
//  Copyright © 2017 Livleen Rai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property UIImage *image;

- (void)setUpCell;
@end
