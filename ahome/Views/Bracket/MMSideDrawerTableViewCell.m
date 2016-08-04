// Copyright (c) 2013 Mutual Mobile (http://mutualmobile.com/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import "MMSideDrawerTableViewCell.h"
#import "ASideDrawer.h"

#define model_size  18

@implementation MMSideDrawerTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.backgroundColor = [UIColor clearColor];
    [self setSelectionStyle:UITableViewCellSelectionStyleBlue];
    
    UIView *selectedView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
    [selectedView setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:.3]];
    [self setSelectedBackgroundView:selectedView];
    
    _modelImage = [[UIImageView alloc]init];
    [_modelImage setCenter:CGPointMake(40, [MMSideDrawerTableViewCell heightForCell]/2.)];
    [_modelImage setBounds:CGRectMake(0, 0, model_size, model_size)];
    _modelImage.alpha = .7;
    [self addSubview:_modelImage];
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    [_titleLabel setTextColor:[UIColor colorWithRed:1. green:1. blue:1. alpha:.7]];
    _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _titleLabel.numberOfLines = 1;
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    _titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [self addSubview:_titleLabel];
    return self;
}

- (void)setDataForCell:(id)data andDel:(id)delObj {
    ASideDrawer *sideDrawer = (ASideDrawer*)data;
    
    [_modelImage setImage:[UIImage imageNamed:sideDrawer.menuImage]];
    
    NSAttributedString *attributedString =[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",sideDrawer.menuTitle] attributes:@{NSKernAttributeName : @(3.)}];
    [_titleLabel setAttributedText:attributedString];
    CGSize titleSize = CGSizeMake(self.frame.size.width, 20000.0f);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:_titleLabel.font, NSFontAttributeName,nil];
    titleSize =[_titleLabel.text boundingRectWithSize:titleSize options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    titleSize.width = 2*titleSize.width;
    [_titleLabel setFrame:CGRectMake([[AUtilities sharedInstance]sizeLeftSideDrawer], (self.frame.size.height-titleSize.height)/2., titleSize.width, titleSize.height)];
}

+ (float)heightForCell {
    return 44.;
}

@end
