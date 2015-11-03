//
//  YCSexChooseView.m
//  Huake
//
//  Created by jhonny.copper on 15/7/9.
//  Copyright (c) 2015年 BingJun. All rights reserved.
//

#import "PopView.h"

#define kArrowHeight 10.0f //the height of sharp point
#define ROW_HEIGHT 36.0f
#define SPACE 1.0f
#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1]

@interface PopView()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic) CGPoint showPoint;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIButton *handerView;

@end

@implementation PopView

/**
 *  init self
 *
 *  @param point  the coordinate of the view's sharp point
 *  @param titles title's array
 *  @param images image's array
 *
 *  @return self
 */
- (id)initWithPoint:(CGPoint)point titles:(NSArray *)titles images:(NSArray *)images {
    
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.borderColor = [UIColor clearColor];
        self.showPoint = point;
        self.titleArray = titles;
        self.imageArray = images;
        
        self.frame = [self getViewFrame];
        [self addSubview:self.tableView];
    }
    return self;
}

/**
 *  get self's frame
 */
- (CGRect)getViewFrame{
    
    CGRect frame = CGRectZero;
    
    UIFont *font = [UIFont systemFontOfSize:16.0f];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    
    //get height
    frame.size.height = [self.titleArray count] * ROW_HEIGHT + kArrowHeight;
    
    //get width
    for (NSString *title in self.titleArray) {
        
        CGFloat width = [title boundingRectWithSize:CGSizeMake(300, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size.width;
        frame.size.width = MAX(width, frame.size.width);
//        NSLog(@"width = %f",frame.size.width);
    }
    
    frame.size.width = 10 + 25 + 10 +frame.size.width + 30;
    
    //get x and y
    frame.origin.x = self.showPoint.x - frame.size.width/2;
    frame.origin.y = self.showPoint.y;
    
    return frame;
}

/**
 *  init tableView
 */
- (UITableView *)tableView{
    
    if (_tableView != nil) {
        return _tableView;
    }
    
    CGRect rect = self.frame;
    
    rect.origin.x = SPACE;
    rect.origin.y = kArrowHeight;
    rect.size.width = rect.size.width - SPACE * 2;
    rect.size.height -= (kArrowHeight + SPACE);
    
    self.tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //rebounce
    _tableView.alwaysBounceHorizontal = NO;
    _tableView.alwaysBounceVertical = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.scrollEnabled = NO;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return _tableView;
}

#pragma mark UITableView_DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_titleArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return ROW_HEIGHT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.backgroundView = [[UIView alloc] init];
    cell.backgroundView.backgroundColor = RGB(239, 239, 244);
    
    cell.imageView.image = [UIImage imageNamed:[_imageArray objectAtIndex:indexPath.row]];
    
    cell.textLabel.font = [UIFont systemFontOfSize:16.0f];
    cell.textLabel.text = [_titleArray objectAtIndex:indexPath.row];
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
        
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
    return cell;
    
}
#pragma mark UITableView_Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (self.selectRowAtIndex) {
        self.selectRowAtIndex(indexPath.row);
    }
    [self dismiss];
}


/**
 *  draw view
 */
- (void)drawRect:(CGRect)rect{
    
    //set border color
    
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor clearColor].CGColor;
    [self.borderColor set];
    CGRect frame = CGRectMake(0, kArrowHeight, self.bounds.size.width, self.bounds.size.height - kArrowHeight);
    
    float xMin = CGRectGetMinX(frame);
    float yMin = CGRectGetMinY(frame);
    
    float xMax = CGRectGetMaxX(frame);
    float yMax = CGRectGetMaxY(frame);
    
//    NSLog(@"x = %f,%f, y = %f,%f",xMin,xMax,yMin,yMax);
    
    //To switch a point from one coordinate system to the receiver's coordinate system
    CGPoint arrowPoint = [self convertPoint:self.showPoint fromView:_handerView];
    
    UIBezierPath *popoverPath = [UIBezierPath bezierPath];
    [popoverPath moveToPoint:CGPointMake(xMin, yMin)];
    [popoverPath addLineToPoint:CGPointMake(arrowPoint.x - kArrowHeight, yMin)];
    
    //draw the arrow
    [popoverPath addLineToPoint:arrowPoint];
    [popoverPath addLineToPoint:CGPointMake(arrowPoint.x + kArrowHeight, yMin)];
    
    [popoverPath addLineToPoint:CGPointMake(xMax, yMin)];
    [popoverPath addLineToPoint:CGPointMake(xMax, yMax)];
    [popoverPath addLineToPoint:CGPointMake(xMin, yMax)];
    
    [RGB(245, 245, 245) setFill];
    [popoverPath fill];
    
    [popoverPath closePath];
    [popoverPath stroke];
}

/**
 *  show view
 */
- (void)show{
    
    if (self.isSeparator != NO) {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    
    self.handerView = [UIButton buttonWithType:UIButtonTypeCustom];
    [_handerView setFrame:[UIScreen mainScreen].bounds];
    [_handerView setBackgroundColor:[UIColor clearColor]];
    [_handerView addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [_handerView addSubview:self];
    //
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:_handerView];
    
    CGPoint arrowPoint = [self convertPoint:self.showPoint fromView:_handerView];
    self.layer.anchorPoint = CGPointMake(arrowPoint.x / self.frame.size.width, arrowPoint.y / self.frame.size.height);
    
    //when set the anchorPoint ,the view's frame will skewed
    self.frame = [self getViewFrame];
    
    //create animation
    self.alpha = 0.0f;
    self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    [UIView animateWithDuration:0.1f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.transform = CGAffineTransformMakeScale(1.05f, 1.05f);
        self.alpha = 1.0f;
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.08f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:nil];
    }];
}

/**
 *  dismiss
 */
- (void)dismiss{
    
    [UIView animateWithDuration:0.2f animations:^{
        self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [_handerView removeFromSuperview];
    }];
}
@end
