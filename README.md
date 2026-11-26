# JPush 6.3.1 静态Framework客户验证分支

本分支为normal客户验证产物，不代表正常公有云正式发行或Tag。根直接`JPush.xcframework`，两片均为静态archive封装，模块名`JPush`，Modules/module.modulemap保留公开ObjC头。

公开SDK仅保留发行所需文件及合法资源，不携带内部追溯JSON。JPush每target架构只保留public.swiftinterface（device1、simulator2）；JCore无需Swift源模块。ABI/私有接口/文档定位等审计资料保留在内部构建证据，不进入客户包。`JPushWrapper`仍提供系统链接及SPM隐私resource。

## 集成

JPush仓库`https://github.com/jpush/jpush-sdk.git`选择`customer/uts-static-framework-6.3.1-jenkins-cec94711`；JCore仓库`https://github.com/jpush/jcore-sdk.git`选择`customer/uts-static-framework-5.6.1-jenkins-cec94711`。集成方须分别添加并最终链接兼容的JPush与JCore产品。

JPush Package.swift不声明Core package/product依赖，不锁其版本、分支或commit；这不代表JPush可脱离Core运行，也不保证任意Core版本兼容。JPush podspec的约束保持`JCore > 5.5.0`；验证客户分支时Podfile应显式选择对应Git分支，避免解析到其它渠道。Wrapper不能因取消Core绑定而删除。

主SDK发行包normal/noidfa/pure各自隔离；此分支仅normal，不同时链接多个SKU以免重复符号。Extension未调整，维持原发行结构，本分支未新增Extension SPM产品。

## 验证范围

产物由原Jenkins环境生成，未调整构建环境、未使用本地替代SDK。精简后的各SKU/配置在原入口执行三target架构的fresh-cache Swift公开接口导入、ObjC legacy头编译和实际链接，目标device/x86_64模拟器iOS13.0、arm64模拟器iOS14.0；生成程序未运行。这些检查不等于完整Xcode App/SPM/Pods工程、归档隐私资源、最低系统运行、签名真机或客户UTS验收，请使用实际工程继续验证。

内部来源、archive映射和构建日志独立保留，没有为瘦身取消校验。历史提交保留；本验证分支不作为正常渠道发行。
