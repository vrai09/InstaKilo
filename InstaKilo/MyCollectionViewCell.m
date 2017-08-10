//
//  MyCollectionViewCell.m
//  InstaKilo
//
//  Created by Livleen Rai on 2017-08-09.
//  Copyright © 2017 Livleen Rai. All rights reserved.
//

#import "MyCollectionViewCell.h"


@implementation MyCollectionViewCell

- (void)setUpCell {
    if(self.image) {
        self.imageView.image = self.image;
    }
}

@end
