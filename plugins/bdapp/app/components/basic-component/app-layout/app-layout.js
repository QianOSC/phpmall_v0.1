(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["components/basic-component/app-layout/app-layout"],{"0b17":function(t,n,o){"use strict";o.r(n);var e=o("6c54"),r=o("6adc");for(var a in r)"default"!==a&&function(t){o.d(n,t,function(){return r[t]})}(a);o("3a2b");var i=o("2877"),u=Object(i["a"])(r["default"],e["a"],e["b"],!1,null,"84c55900",null);n["default"]=u.exports},"3a2b":function(t,n,o){"use strict";var e=o("7733"),r=o.n(e);r.a},"6adc":function(t,n,o){"use strict";o.r(n);var e=o("a98a"),r=o.n(e);for(var a in e)"default"!==a&&function(t){o.d(n,t,function(){return e[t]})}(a);n["default"]=r.a},"6c54":function(t,n,o){"use strict";var e=function(){var t=this,n=t.$createElement,o=(t._self._c,t.__get_style([t.layoutStyle]));t.$mp.data=Object.assign({},{$root:{s0:o}})},r=[];o.d(n,"a",function(){return e}),o.d(n,"b",function(){return r})},7733:function(t,n,o){},a98a:function(t,n,o){"use strict";(function(t){Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var e=o("2f62"),r=a(o("ff69"));function a(t){return t&&t.__esModule?t:{default:t}}function i(t,n){var o=Object.keys(t);if(Object.getOwnPropertySymbols){var e=Object.getOwnPropertySymbols(t);n&&(e=e.filter(function(n){return Object.getOwnPropertyDescriptor(t,n).enumerable})),o.push.apply(o,e)}return o}function u(t){for(var n=1;n<arguments.length;n++){var o=null!=arguments[n]?arguments[n]:{};n%2?i(o,!0).forEach(function(n){c(t,n,o[n])}):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(o)):i(o).forEach(function(n){Object.defineProperty(t,n,Object.getOwnPropertyDescriptor(o,n))})}return t}function c(t,n,o){return n in t?Object.defineProperty(t,n,{value:o,enumerable:!0,configurable:!0,writable:!0}):t[n]=o,t}var s=function(){return o.e("components/basic-component/app-tab-bar/app-tab-bar").then(o.bind(null,"1d56"))},p=function(){return o.e("components/basic-component/app-layout/app-payment/app-payment").then(o.bind(null,"bb6d"))},l=function(){return o.e("components/basic-component/app-layout/app-user-login/app-user-login").then(o.bind(null,"ce0f"))},f=function(){return o.e("components/basic-component/app-loading/app-loading").then(o.bind(null,"2428"))},d=function(){return o.e("components/basic-component/app-report-error/app-report-error").then(o.bind(null,"1031"))},b=function(){return o.e("components/basic-component/app-prompt-box/app-prompt-box").then(o.bind(null,"387a"))},g=function(){return o.e("components/basic-component/app-layout/app-coupon-modal/app-coupon-modal").then(o.bind(null,"a3b2"))},h={name:"app-layout",data:function(){return{currentRoute:"",tabbarbool:!0,navigationBarTitle:"",page_count:getCurrentPages().length}},components:{"app-tab-bar":s,"app-payment":p,"app-user-login":l,"app-loading":f,"app-report-error":d,"app-prompt-box":b,"app-coupon-modal":g},props:{haveBackground:{type:Boolean,default:function(){return!0}},overflow:{type:Boolean,default:function(){return!0}}},computed:u({},(0,e.mapState)("mallConfig",{tabBarNavs:function(t){return t.navbar.navs},bar_title:function(t){return t.bar_title},top_background_color:function(t){return t.navbar.top_background_color},top_text_color:function(t){return t.navbar.top_text_color},bottom_background_color:function(t){return t.navbar.bottom_background_color},is_must_login:function(t){return t.mall.setting.is_must_login}}),{},(0,e.mapState)("user",{accessToken:function(t){return t.accessToken}}),{},(0,e.mapState)("gConfig",{reportAndError:function(t){return t.reportAndError},promptBox:function(t){return t.promptBox},iphone:function(t){return t.iphone}}),{isGuest:function(){return""===this.$store.state.user.accessToken||null===this.$store.state.user.accessToken}},(0,e.mapState)("loading",{loadingType:function(t){return t.type},loadingText:function(t){return t.text},loadingColor:function(t){return t.color},loadingBackgroundImage:function(t){return t.backgroundImage},loadingIsShow:function(t){return t.isShow}}),{},(0,e.mapGetters)("iPhoneX",{BotHeight:"getBotHeight"}),{},(0,e.mapGetters)("iPhoneX",{getNavHei:"getNavHei"}),{layoutStyle:function(){return this.overflow?{overflow:"hidden"}:""}}),watch:{tabBarNavs:{handler:function(){this.setTabbar(),void 0!==this.top_background_color&&t.setNavigationBarColor({backgroundColor:this.top_background_color,frontColor:this.top_text_color})},immediate:!0},is_must_login:{handler:function(){!this.$user.isLogin()&&1!==this.is_must_login||"/pages/disabled/disabled"==this.$platDiff.route()||this.$store.dispatch("user/info")},immediate:!0},accessToken:{handler:function(){this.accessToken||this.$store.commit("user/info",null)},immediate:!0}},created:function(){var t=this;this.$store.dispatch("mallConfig/actionGetConfig"),this.$nextTick(function(){var n=t.$platDiff.route();r.default.setNavigationBarTitle(t.bar_title,n).then(function(o){"/pages/article/article-detail/article-detail"!=n&&(t.navigationBarTitle=o)})}),!this.$user.isLogin()&&1!==this.is_must_login||"/pages/disabled/disabled"==this.$platDiff.route()||this.$store.dispatch("user/info"),this.$hideLoading()},mounted:function(){this.currentRoute=this.$platDiff.tabBarUrl(null,this.page_count),this.setTabbar(),void 0!==this.top_background_color&&t.setNavigationBarColor({backgroundColor:this.top_background_color,frontColor:this.top_text_color})},beforeDestroy:function(){this.$hideLoading()},methods:{touchMove:function(){return!0},setTabbar:function(){var t=this.currentRoute;this.$appScene&&[1001,1045,1046,1058,1067,1084,1091].indexOf(this.$appScene)>-1&&(t.indexOf("appid")>-1||t.indexOf("appmsg_compact_url")>-1||t.indexOf("wxwork_userid")>-1)&&(t=this.$utils.deleteUrlParam(t,["appid","appmsg_compact_url","wxwork_userid"],!0));for(var n=0;n<this.tabBarNavs.length;n++)if(t==this.tabBarNavs[n].url)return this.tabbarbool=!0;return this.tabbarbool=!1}}};n.default=h}).call(this,o("5486")["default"])}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'components/basic-component/app-layout/app-layout-create-component',
    {
        'components/basic-component/app-layout/app-layout-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('5486')['createComponent'](__webpack_require__("0b17"))
        })
    },
    [['components/basic-component/app-layout/app-layout-create-component']]
]);                
