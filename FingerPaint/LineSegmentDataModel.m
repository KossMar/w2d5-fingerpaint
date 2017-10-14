//
//  LineSegmentData.m
//  FingerPaint
//
//  Created by Mar Koss on 2017-10-13.
//  Copyright © 2017 Mar Koss. All rights reserved.
//

#import "LineSegmentDataModel.h"

@implementation LineSegmentDataModel

- (instancetype)initWithFirstPoint:(CGPoint)firstPoint secondPoint:(CGPoint)secondPoint {
    self = [super init];
    if (self) {
        _firstPoint = firstPoint;
        _secondPoint = secondPoint;
    }
    return self;
}

@end
