//
//  DrawingView.m
//  FingerPaint
//
//  Created by Mar Koss on 2017-10-13.
//  Copyright © 2017 Mar Koss. All rights reserved.
//

#import "DrawingView.h"
#import "LineSegmentDataModel.h"

@interface DrawingView ()

@property (nonatomic) NSMutableArray<LineSegmentDataModel *> *blackLineArr;
@property (nonatomic) NSMutableArray<LineSegmentDataModel *> *blueLineArr;
@property (nonatomic) NSMutableArray<LineSegmentDataModel *> *redLineArr;
@property (nonatomic , weak) UIColor *color;

@end

@implementation DrawingView

- (IBAction)color:(id)sender {
    switch ([sender tag]) {
        case 0: {
            self.color = [UIColor blackColor];
            break;
        }
        case 1 : {
            self.color = [UIColor blueColor];
            break;
        }
        case 2 : {
            self.color = [UIColor redColor];
            break;
        }
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _blackLineArr = [NSMutableArray new];
        _blueLineArr = [NSMutableArray new];
        _redLineArr = [NSMutableArray new];
        _color = [UIColor blackColor];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint first = [touch previousLocationInView:self];

    LineSegmentDataModel *segment = [[LineSegmentDataModel alloc] initWithFirstPoint:first
                                                                         secondPoint:first];
    if (self.color == [UIColor blackColor]){
        [self.blackLineArr addObject:segment];
    }
    else if (self.color == [UIColor blueColor]) {
        [self.blueLineArr addObject:segment];
    }
    else if (self.color == [UIColor redColor]) {
        [self.redLineArr addObject:segment];
    }

    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint first = [touch previousLocationInView:self];
    CGPoint second = [touch locationInView:self];
    LineSegmentDataModel *segment = [[LineSegmentDataModel alloc] initWithFirstPoint:first
                                                                         secondPoint:second];
    
    if (self.color == [UIColor blackColor]){
        [self.blackLineArr addObject:segment];
    }
    else if (self.color == [UIColor blueColor]) {
        [self.blueLineArr addObject:segment];
    }
    else if (self.color == [UIColor redColor]) {
        [self.redLineArr addObject:segment];
    }

    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
   
    {
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineWidth = 5.0;
        path.lineCapStyle = kCGLineCapRound;
        [[UIColor blackColor] setStroke];

        for (LineSegmentDataModel *segment in self.blackLineArr) {
            if (CGPointEqualToPoint(segment.firstPoint, segment.secondPoint)) {
                [path moveToPoint:segment.firstPoint];
                continue;
            }
            [path addLineToPoint:segment.firstPoint];
            [path addLineToPoint:segment.secondPoint];
        }
        [path stroke];
    }
    
    {
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineWidth = 5.0;
        path.lineCapStyle = kCGLineCapRound;
        [[UIColor blueColor] setStroke];
        
        for (LineSegmentDataModel *segment in self.blueLineArr) {
            if (CGPointEqualToPoint(segment.firstPoint, segment.secondPoint)) {
                [path moveToPoint:segment.firstPoint];
                continue;
            }
            [path addLineToPoint:segment.firstPoint];
            [path addLineToPoint:segment.secondPoint];
        }
        [path stroke];
    }
    
    {
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineWidth = 5.0;
        path.lineCapStyle = kCGLineCapRound;
        [[UIColor redColor] setStroke];
        
        for (LineSegmentDataModel *segment in self.redLineArr) {
            if (CGPointEqualToPoint(segment.firstPoint, segment.secondPoint)) {
                [path moveToPoint:segment.firstPoint];
                continue;
            }
            [path addLineToPoint:segment.firstPoint];
            [path addLineToPoint:segment.secondPoint];
        }
        [path stroke];
    }
    
}

- (void)clear {
    [self.blackLineArr removeAllObjects];
    [self.blueLineArr removeAllObjects];
    [self.redLineArr removeAllObjects];
    [self setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
