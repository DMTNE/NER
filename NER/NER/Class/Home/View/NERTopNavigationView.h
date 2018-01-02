//
//  NERTopNavigationView.h
//  NER
//
//  Created by Fangjw on 2017/12/7.
//  Copyright © 2017年 New Energy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NERTopNavigationViewDelegate <NSObject>

-(void)nerTopNavigationViewSearchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;

-(void)nerTopNavigationViewSearchBarShouldBeginEditing:(UISearchBar *)searchBar;

- (void)nerTopNavigationVieSearchBarCancelButtonClicked:(UISearchBar *)searchBar;

@end

@interface NERTopNavigationView : UIView
@property (nonatomic, weak)id<NERTopNavigationViewDelegate>nerTopNavigationViewDelegate;

-(void)closeSearch;

@end
