# JLPictureGray
NormalImageConvertToGray
采用简单的策略模式，将opencv的算法和苹果自带的算法分离。如果不喜欢使用这种方式的话可以采取下tools文件夹下的工具类处理图片的方式（不讲了）。
######策略方式：
```
//第一步：添加opencv.framework，将工具类JLImageUtils，SystemStrategy，OpencCVStrategy导入你的工程，并在你需要的地方导入头文件：
import "JLImageUtils.h"
#import "SystemStrategy.h"
#import "OpencCVStrategy.h"
//第二步：初始化，处理图片：
_utils = [[OpencCVStrategy alloc] init];
UIImage *img = [_utils imageToGrayImage:_imgView.image];
_imgView.image = img;
//完成
```

