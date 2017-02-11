//
//  YBAFN.m
//  Kergou
//
//  Created by 王迎博 on 16/6/13.
//  Copyright © 2016年 佳品. All rights reserved.
//

#import "YBAFN.h"
#import "AFNetworking.h"


@interface YBAFN ()

@property (nonatomic, assign) BOOL isFirstEqualToOne;
@end


@implementation YBAFN


/**
 *  上传图片
 *
 *  @param baseUrlStr   baseUrlStr
 *  @param appendUrlStr appendUrlStr
 *  @param para         参数
 *  @param imageArray   图片数组
 *  @param successBlock 成功block
 *  @param failureBlock 失败block
 *  @param progressUp   上传进度
 */
+(void)UPDATA_baseUrlStr:(NSURL *)baseUrl
            appendUrlStr:(NSString *)appendUrlStr
              parameters:(NSDictionary *)para
            withImageArr:(NSArray *)imageArray
              sourceName:(NSArray *)nameArr
                fileName:(NSArray *)fileNameArr
                mimeType:(NSString *)type
        withSuccessBlock:(requestSuccess)successBlock
         withFailurBlock:(requestFailure)failureBlock
      withUpLoadProgress:(uploadProgress)progressUp
{
    NSMutableArray *tempSourceNameArr = [NSMutableArray array];
    NSMutableArray *tempFileNameArr = [NSMutableArray array];
    if (nameArr.count > 0) {
        [tempSourceNameArr addObjectsFromArray:nameArr];
    }else {
        for (int i = 0; i < imageArray.count; i ++) {
            [tempSourceNameArr addObject: [NSString stringWithFormat:@"name%d",i]];
        }
    }
    
    if (fileNameArr.count > 0) {
        [tempFileNameArr addObjectsFromArray:fileNameArr];
    }else {
        for (int i = 0; i < imageArray.count; i ++) {
            [tempFileNameArr addObject: [NSString stringWithFormat:@"image%d",i]];
        }
    }
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:baseUrl];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",nil];
    NSString *mimeTypeStr = [NSString stringWithFormat:@"image/%@",type];
    
    [manager POST:appendUrlStr parameters:para constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        int j = 0;
        for (UIImage *image in imageArray) {
            NSData *imgData;
            if ([type isEqualToString:@"jpg"]) {
                imgData = UIImageJPEGRepresentation(image, 0.5);
            } else
            {
                imgData = UIImagePNGRepresentation(image);
            }
            [formData appendPartWithFileData:imgData name:[tempSourceNameArr objectAtIndex:j] fileName:[tempFileNameArr objectAtIndex:j] mimeType:mimeTypeStr];
            j++;
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        NSLog(@"......fractionCompleted:%f",uploadProgress.fractionCompleted);
//        NSLog(@"......completedUnitCount:%lld",uploadProgress.completedUnitCount);
//        NSLog(@"......totalUnitCount:%lld",uploadProgress.totalUnitCount);
        
        if (uploadProgress.totalUnitCount != 0.00) {
            CGFloat progress = uploadProgress.completedUnitCount/(CGFloat)uploadProgress.totalUnitCount;
            progressUp(progress);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
  
}



/**
 *  自定义提醒
 *
 *  @param str   提醒文字
 *  @param style 动画风格
 */
+(void)YB_alertViewWithShowStr:(NSString *)str withStyle:(LXAShowAnimationStyle)style
{
    LXAlertView *alert = [[LXAlertView alloc] initWithTitle:@"提示" titleColor:[UIColor blackColor] message:str messageColor:[UIColor grayColor] cancelBtnTitle:nil otherBtnTitle:@"确定" clickIndexBlock:^(NSInteger clickIndex, UIButton *cancelBtn, UIButton *otherBtn) {
    }];
    if (!style) {
        style = LXASAnimationTopShake;
    }
    alert.animationStyle=style;
    [alert showLXAlertView];
}


+ (LXAlertView *)YB_alertViewContent:(NSString *)showStr WithStyle:(LXAShowAnimationStyle)style indexBlock:(void (^)(NSInteger btnIndex))indexBlock
{
    LXAlertView *alert = [[LXAlertView alloc] initWithTitle:@"提示" titleColor:[UIColor blackColor] message:showStr messageColor:[UIColor grayColor] cancelBtnTitle:nil otherBtnTitle:@"确定" clickIndexBlock:^(NSInteger clickIndex, UIButton *cancelBtn, UIButton *otherBtn) {
        
    }];
    alert.clickBlock = ^(NSInteger clickIndex,UIButton *cancelBtn,UIButton *otherBtn){
        indexBlock(clickIndex);
    };
    alert.animationStyle=style;
    [alert showLXAlertView];
    return alert;
}

@end
