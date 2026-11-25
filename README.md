# JPush UTS 静态 Framework 验证分支

此分支基于普通公有云SDK 6.3.0，仅改变XCFramework容器为静态.framework。不是正常版本发布；normal/noidfa/JBasic没有混用，SDK archive未重编。模块名保持JPush。原archive到Framework同名binary的SHA映射见Artifacts/JPush.provenance.json。

在Xcode添加仓库 `https://github.com/jpush/jpush-sdk.git`，选择branch `customer/uts-static-framework-6.3.0-cec94711`，添加JPush product。JPush的依赖指向独立JCore验证分支；同时集成时不要再引入正常JCore Pod/旧.a，避免重复链接。App按原SDK要求设置`-ObjC`；SPM包装目标负责资源bundle和已有系统链接项。

设备和模拟器每片包含JPush.framework，Modules/module.modulemap，公开Headers、Info.plist、PrivacyInfo.xcprivacy；无Headers根module map。框架为静态库，不应手工Embed & Sign。Pods仅使用此分支local/git显式来源，两组件须同时覆盖到对应验证分支；不发布该podspec到Trunk。

UTS客户验证：删除既有重复本地SDK依赖并清理缓存；将此隔离SPM组合接入UTS生成iOS工程；执行Swift `import JPush` / `import JCore`、完整clean build（模拟器/真机）、初始化与通知回调验证。请保存Xcode及UTS版本、精确两个commit、目标架构、构建日志和真机结果。UTS工具链/工程未在本仓提供，不能把原生App通过当作UTS通过。权限/AppKey由客户运行时提供，不写入本分支。

回退：恢复原始6.3.0/5.6.0普通包锁定依赖并删除本组合；原tag/main未修改。
