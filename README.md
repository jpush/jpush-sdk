# JPush 6.3.1 Jenkins客户验证分支

本分支仅normal静态Framework，来自既有Jenkins原入口真实编译，不代表正常渠道发行或Tag。

- Jenkins：https://jenkins.qa.jpushoa.com/job/sdk-build/job/ios-sdk-build/job/ios-core-push-dev/460/；源码：`f963d29a151f039f1de738dceef5ff5454c83c90`。
- 实际controls：`2dd88c0f7c89339777b39276041113d31615b284`；原release ZIP SHA：`c35d6a2d3b43560dcfe8b109e3ccb62a96cae5e8855af56e3e6278ad8e225ee3`。
- 根直接`JPush.xcframework`，两片为静态archive，Modules/module.modulemap；保留真实Swift接口（如有）及隐私资源。
- `JPushWrapper`提供系统库链接和SPM隐私resource，不能因为取消Core绑定而删除。
- 本轮原SDK ZIP已统一JPush normal/noidfa、JCore normal/noidfa/pure，debug/release与真机/模拟器分别核验。JCore各SKU先合并对应JCommon，再封装；pure外层仍jbasic，实际模块JCore。此GitHub分支只复制normal，不混入其他SKU。
- Extension本轮未改，保持原ZIP中的raw archive布局，不新增SPM Extension产品。

## SPM集成

分别添加`https://github.com/jpush/jpush-sdk.git`的`customer/uts-static-framework-6.3.1-jenkins-cec94711`和`https://github.com/jpush/jcore-sdk.git`的`customer/uts-static-framework-5.6.1-jenkins-cec94711`，把需要的JPush、JCore产品加到实际App target。

JPush Package.swift不声明Core package/product依赖，不锁Core版本、分支或commit。集成方须独立选择并最终链接兼容的JCore；取消包管理绑定不代表JPush可脱离Core运行，也不保证任意Core版本兼容。不同时链接normal/noidfa/pure以免重复符号。

## CocoaPods集成

客户JPush podspec的Core约束为`> 5.5.0`，没有固定到5.6.1。验证本批制品时，请在Podfile中显式把JPush/JCore指向各自上述客户Git分支，避免自动解析到其他渠道Core；具体兼容选择仍由集成方验收。此变更未发布到标准Specs渠道。

## 验证边界

仅现有Jenkins构建SDK，未调整Job/pipeline/节点/Xcode/global locale/账号权限，不使用local替代产物。原ZIP主SHA、版本/runtime编码、SKU/隐私、静态magic及封装前后archive SHA已核。源码构建期间正常adapter/BuildID/开关修改使dirty=true，不能说全过程clean。

本批完整consumer SPM/Pods clean build、App归档隐私resource、签名真机与UTS未执行；原Job没有消费端阶段。没有以旧local或旧normal制品测试结果代替。最低系统配置不等于最低系统运行证明。客户需用实际工程验收。

来源详见PROVENANCE.json及XCF内RepackProvenance.json。历史local和上一轮Jenkins提交保留，不篡改producer。
