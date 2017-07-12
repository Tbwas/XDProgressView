# XDProgressView
Q: XDProgressView和UIProgressView相比有什么不同？
   

A:  1. UIProgressView的下面这两个属性暂时没有去实现，个人觉得可有可无。除此之外，尽可能和系统原生保持一致。</br>

    @property(nonatomic) UIProgressViewStyle progressViewStyle;
    @property(nonatomic, strong, nullable) NSProgress *observedProgress
     
　  2. XDProgressView可以由你心情任意设置高度，也可在上面显示文字。
   
# 安装
### 使用CocoaPods

```
  platform :ios, '8.0'
  
  target 'TargetName' do
  pod 'XDProgressView'
  end
```
     
若执行命令`pod search XDProgressView`出现以下错误，`[!] Unable to find a pod with name, author, summary, or description matching...`， 
先执行`rm ~/Library/Caches/CocoaPods/search_index.json`，再执行`pod search XDProgressView`即可。
     
### 直接下载源码
  
     `git clone` 或者 `download`, 将下载好的demo中的`progressView`文件夹下的整个`XDProgressView`文件拖入项目中即可。
     
# 使用
 
若是通过CocoaPods方式安装，需要这样导入头文件`import <XDProgressView.h>`, 否则的话`import 'XDProgressView.h'`，使用方式和`UIProgressView`基本相同，具体请看接口文件。
