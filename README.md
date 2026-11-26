# JPush 6.3.1 Jenkins客户验证分支

此分支只使用原Jenkins环境实际构建的normal SDK，未正式发布渠道或Tag。

- producer：Jenkins；构建：[#459](https://jenkins.qa.jpushoa.com/job/sdk-build/job/ios-sdk-build/job/ios-core-push-dev/459/)。
- SDK源码：`421158e3319678a322f939191b4f9c3e88defb3e`；controls：`6a4c500923c733d038818eff6bd4cfec29c6bb27`。
- 既有工具链：Xcode14.2 / Swift5.7.2 / Python3.9.6。未调整Job、pipeline、节点或全局环境配置，未使用local替代SDK包。
- 原SDK ZIP SHA-256：`548f476a55979b87534eeb0eaf9ef56faaf9e6b46395c3e08f517497a5fed105`。
- 根目录直接`JPush.xcframework`，两片均静态Framework，map位于Modules/module.modulemap。
- `JPushWrapper`仅传递系统库/依赖与隐私bundle；实际SDK模块名仍`JPush`。JCore normal在JCommon最终合并后封装，原archive与Framework字节SHA一致。

## 集成

Xcode添加`https://github.com/jpush/jpush-sdk.git`，选择分支`customer/uts-static-framework-6.3.1-jenkins-cec94711`，使用JPush产品。
JPush依赖配套JCore的`customer/uts-static-framework-5.6.1-jenkins-cec94711`分支；不要混用旧local、正常渠道或JBasic/其它包型。

## 验证边界

Jenkins原SDK构建和产物来源、版本、静态格式、封装哈希已核；本批Jenkins产物的完整consumer App/SPM构建、归档与UTS运行尚未验证，未以旧local产物的测试结果代替。SDK源码最低配置不等于最低系统实机运行证明。请在客户实际UTS工程验收；不要将本验证分支当正式发行。

来源详见PROVENANCE.json及XCFramework内RepackProvenance.json。旧local分支保留历史，不作为本分支制品来源。
