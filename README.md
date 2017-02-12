# XDProgressView
Q: XDProgressView和UIProgressView相比有什么不同？
   

A:  1. UIProgressView的下面这两个属性暂时没有去实现，个人觉得可有可无。</br>

    @property(nonatomic) UIProgressViewStyle progressViewStyle;
    @property(nonatomic, strong, nullable) NSProgress *observedProgress
     
　  2. XDProgressView可以由你心情任意设置高度，也可在上面显示文字。
