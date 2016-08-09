//
//  DemoTableVc.m
//  ZZCoreAnimationDemo
//
//  Created by xcz on 16/7/26.
//  Copyright © 2016年 Pearl-Z. All rights reserved.
//

#import "DemoTableVc.h"
#import "CATransitionVc.h"
#import "CAAnimationGroupVc.h"
#import "CASpringAnimationVc.h"
#import "CAKeyframeAnimationVc.h"
#import "CABasicAnimationVc.h"
#import "UIEffectDesignerVc.h"
#import "CAEmitterLayerVc.h"

@implementation DemoTableVc


- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"核心动画示例";
    
    self.tableView.tableFooterView = [UIView new];
    
}



#pragma mark - tabelview delegate & datasorce

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section) {
        return 2;
    }
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *ID = [NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = 0;
    if (indexPath.section) {
        if (!indexPath.row) {
            cell.textLabel.text = @"粒子动画(CAEmitterLayer)";
        }else{
            cell.textLabel.text = @"粒子动画(UIEffectDesignerView)";
        }
        return cell;
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"转场动画(CATransition)";
            break;
            
        case 1:
            cell.textLabel.text = @"基本动画(CABasicAnimation)";
            break;
            
        case 2:
            cell.textLabel.text = @"弹性动画(CASpringAnimation)";
            break;
            
        case 3:
            cell.textLabel.text = @"关键帧动画(CAKeyframeAnimation)";
            break;
            
        case 4:
            cell.textLabel.text = @"动画组(CAAnimationGroup)";
            break;

        default:
            break;
    }
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section) {
        if (!indexPath.row) {
            CAEmitterLayerVc *vc = [[CAEmitterLayerVc alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            UIEffectDesignerVc *vc = [[UIEffectDesignerVc  alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        return;
    }
    
    switch (indexPath.row) {
        case 0:{
            CATransitionVc *vc = [[CATransitionVc alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case 1:{
            CABasicAnimationVc *vc = [[CABasicAnimationVc alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case 2:{
            CASpringAnimationVc *vc = [[CASpringAnimationVc alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case 3:{
            CAKeyframeAnimationVc *vc = [[CAKeyframeAnimationVc alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case 4:{
            CAAnimationGroupVc *vc = [[CAAnimationGroupVc alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
  
        default:
            break;
    }
}


@end
