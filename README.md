##UIAlertController的使用
UIAlertController从iOS8.0开始被使用。旨在替代UIAlertView和UIActionSheet这两个控件。
所以UIAlertController有一个`preferredStyle`属性属性，该属性是个`UIAlertControllerStyle`类型的枚举值，其值如下：
```
typedef NS_ENUM(NSInteger, UIAlertControllerStyle) {
UIAlertControllerStyleActionSheet = 0,
UIAlertControllerStyleAlert
} NS_ENUM_AVAILABLE_IOS(8_0);
```
不难发现，UIAlertControllerStyle的枚举值分别是`UIAlertControllerStyleActionSheet`和`UIAlertControllerStyleAlert`，如果UIAlertController对象的preferredStyle属性取值为UIAlertControllerStyleActionSheet，那么其作用和效果就相当于iOS8中被废弃的UIActionSheet。
想反，如果UIAlertController对象的preferredStyle属性取值为UIAlertControllerStyleAlert，那么其作用和效果就相当于iOS8中被废弃的UIAlertView。
我们知道，使用UIAlertView和UIActionSheet需要遵守对应的协议并实现相应的方法，因为UIAlertView和UIActionSheet采用delegate的方式处理事件。而UIAlertController则采用灵活的block方式处理事件。所以使用UIAlertController不用再遵守某个协议，只需将响应事件的代码写在block中即可。这一点，让我们想起了NSURLConnection和NSURLsession。
###1.UIAlertControllerStyleActionSheet样式
```
UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:nil preferredStyle:  UIAlertControllerStyleActionSheet];

[alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

}]];
[alert addAction:[UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {

}]];


[alert addAction:[UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

}]];
[self presentViewController:alert animated:true completion:nil];
```
![Sheet.gif](http://upload-images.jianshu.io/upload_images/4242403-efc7eae63e6295cd.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###2.UIAlertControllerStyleAlert样式
####2.1默认样式
```
UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Message" preferredStyle:  UIAlertControllerStyleAlert];

[alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

}]];

[alert addAction:[UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

}]];
[self presentViewController:alert animated:true completion:nil];
```
![Default.gif](http://upload-images.jianshu.io/upload_images/4242403-8d3def832231c36c.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

####2.2登录样式
```
UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:@"Message" preferredStyle:  UIAlertControllerStyleAlert];
[alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
textField.placeholder = @"account";
}];
[alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
textField.placeholder = @"password";
textField.secureTextEntry = YES;
}];
[alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

}]];

[alert addAction:[UIAlertAction actionWithTitle:@"Sure" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
for (UITextField *textField in alert.textFields) {
NSLog(@"textFIeld = %@", textField.text);
}
}]];
[self presentViewController:alert animated:true completion:nil];
```

![Login.gif](http://upload-images.jianshu.io/upload_images/4242403-8750f72124110125.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

