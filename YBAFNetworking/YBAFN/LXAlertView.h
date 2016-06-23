//
//  ViewController.m
//  testCustomTag
//
//  Created by 王迎博 on 16/4/28.
//  Copyright © 2016年 王迎博. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger , LXAShowAnimationStyle) {
    LXASAnimationDefault    = 0,
    LXASAnimationLeftShake  ,
    LXASAnimationTopShake   ,
    LXASAnimationNO         ,
};

typedef void(^LXAlertClickIndexBlock)(NSInteger clickIndex,UIButton *cancelBtn,UIButton *otherBtn);


@interface LXAlertView : UIView

@property (nonatomic,copy)LXAlertClickIndexBlock clickBlock;

@property (nonatomic,assign)LXAShowAnimationStyle animationStyle;


/**
 *  初始化alert方法（根据内容自适应大小，目前只支持1个按钮或2个按钮）
 *
 *  @param title         标题
 *  @param titleColor    标题颜色
 *  @param message       内容（根据内容自适应大小）
 *  @param messageColor  内容颜色
 *  @param cancelTitle   取消按钮
 *  @param otherBtnTitle 其他按钮
 *  @param block         点击事件block
 *
 *  @return 返回alert对象
 */
-(instancetype)initWithTitle:(NSString *)title
                  titleColor:(UIColor *)titleColor
                     message:(NSString *)message
                messageColor:(UIColor *)messageColor
              cancelBtnTitle:(NSString *)cancelTitle
               otherBtnTitle:(NSString *)otherBtnTitle
             clickIndexBlock:(LXAlertClickIndexBlock)block;

/**
 *  showLXAlertView
 */
-(void)showLXAlertView;

/**
 *  不隐藏，默认为NO。设置为YES时点击按钮alertView不会消失（适合在强制升级时使用）
 */
@property (nonatomic,assign)BOOL dontDissmiss;



@end



@interface UIImage (colorful)
//a image using a color
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
