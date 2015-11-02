//
//  ViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import "UMSocial.h"
#import "WXApi.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button =[UIButton buttonWithType:0];
    [button setTitle:@"QQ登录" forState:0];
    [self.view addSubview:button];
    button.titleLabel.font =[UIFont systemFontOfSize:22];
    [button setTitleColor:[UIColor redColor] forState:0];
    
    [button bk_addEventHandler:^(id sender) {
       
     UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
        
        snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
            
            //  获取微博用户名、uid、token等
            
            if (response.responseCode == UMSResponseCodeSuccess) {
                
                UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToQQ];
                
                NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
                
            }});
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
    }];
    /////微信支付
    [self wechat];
    
}
/*微信支付*/
-(void)wechat{
    UIButton *btn =[UIButton buttonWithType:0];
    [btn setTitle:@"微信支付" forState:0];
    [btn setTitleColor:[UIColor redColor] forState:0];
    [self.view addSubview: btn];
    btn.titleLabel.font =[UIFont systemFontOfSize:22];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(30);
    }];
    [btn bk_addEventHandler:^(id sender) {
       //微信支付需要创建支付结构体，结构体中的数据需要向微信平台注册申请之后，微信给你的
        PayReq *pay =[PayReq new];
        pay.nonceStr =@"随机转，防止重复支付";
        pay.partnerId =@"商家向财付通申请的商家id";
        pay.prepayId =@"预支付订单号 ";
        //时间戳，通常是当前时间距离1970年的秒数，具体规则由您的服务员规定
        pay.timeStamp =(UInt32)144040404040;
        pay.package =@"商家根据财付通文档通过填写的数据和签名";
        pay.sign =@"商家根据微信开放平台文档对数据做的签名";
        //发送支付请求，以上数据没有问题，会自动跳转到微信客户端
        [WXApi sendReq:pay];
        
    } forControlEvents:UIControlEventTouchUpInside];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
