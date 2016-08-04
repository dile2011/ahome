//
// Created by Eduardo Scoz on 7/18/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "QFlatAppearance.h"


@implementation QFlatAppearance {

}
- (void)setDefaults {
    [super setDefaults];

    self.labelColorDisabled = [UIColor lightGrayColor];
    self.labelColorEnabled = [UIColor blackColor];

    self.actionColorDisabled = [UIColor lightGrayColor];
    self.actionColorEnabled = [UIColor blackColor];

    self.sectionTitleFont = nil;
    self.sectionTitleShadowColor = [UIColor clearColor];
    self.sectionTitleColor = nil;

    self.sectionFooterFont = [UIFont systemFontOfSize:12];
    self.sectionFooterColor = [UIColor grayColor];
    self.labelAlignment = NSTextAlignmentLeft;

    self.backgroundColorDisabled = [UIColor whiteColor];
    self.backgroundColorEnabled = [UIColor whiteColor];

    self.entryTextColorDisabled = [UIColor lightGrayColor];
    self.entryTextColorEnabled = [UIColor colorWithRed:0.243 green:0.306 blue:0.435 alpha:1.0];
    self.entryAlignment = NSTextAlignmentLeft;

    self.buttonAlignment = NSTextAlignmentLeft;

    self.valueColorEnabled = [UIColor lightGrayColor];
    self.valueColorDisabled = [UIColor lightGrayColor];
    self.valueAlignment = NSTextAlignmentRight;

    self.toolbarStyle = UIBarStyleDefault;
    self.toolbarTranslucent = YES;

    self.cellBorderWidth = 14;
    
#if __IPHONE_7_0
    if ([UIFont respondsToSelector:@selector(preferredFontForTextStyle:)]) {
        self.valueFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        self.labelFont = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        self.entryFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    }
#endif
    
}

- (UIView *)buildHeaderForSection:(QSection *)section andTableView:(QuickDialogTableView *)view andIndex:(NSInteger)index1 {
    return nil;
}

- (float) currentGroupedTableViewMarginForTableView:(UITableView *)tableView
{
    float marginWidth;
    if(tableView.bounds.size.width > 20)
    {
        marginWidth = tableView.bounds.size.width < 400 ? 10 : MAX(31, MIN(45, tableView.bounds.size.width * 0.06));
    }
    else
    {
        marginWidth = tableView.bounds.size.width - 10;
    }
    return marginWidth;
}

- (UIView *)buildFooterForSection:(QSection *)section andTableView:(QuickDialogTableView *)tableView andIndex:(NSInteger)index {
    float margin = [self currentGroupedTableViewMarginForTableView:tableView] + 8;
    if (tableView.style == UITableViewStyleGrouped){
        CGSize textSize = [section.footer sizeWithFont:self.sectionFooterFont constrainedToSize:CGSizeMake(tableView.bounds.size.width-margin-margin, 1000000)];
        UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, textSize.height)];
        containerView.backgroundColor = [UIColor clearColor];
        containerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(margin, 5, tableView.bounds.size.width-margin-margin, textSize.height)];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        label.text = section.footer;
        [containerView addSubview:label];
        label.backgroundColor = [UIColor clearColor];
        label.font = self.sectionFooterFont;
        label.textColor = self.sectionFooterColor;
        label.numberOfLines = 0;
        label.shadowColor = [UIColor colorWithWhite:1.0 alpha:1];
        label.shadowOffset = CGSizeMake(0, 1);
        
        section.footerView = containerView;
        
        return containerView;
    }
    
    return nil;
}

- (void)cell:(UITableViewCell *)cell willAppearForElement:(QElement *)element atIndexPath:(NSIndexPath *)path {
    [super cell:cell willAppearForElement:element atIndexPath:path];
}


@end
