//
//  Photo.m
//  InstaKilo
//
//  Created by Livleen Rai on 2017-08-09.
//  Copyright © 2017 Livleen Rai. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (instancetype)initWithImage:(UIImage*)image location:(NSString *)location subject:(NSString *)subject {
    if(self = [super init]) {
        self.image = image;
        self.location = location;
        self.subject = subject;
    }
    return self;
}
@end
