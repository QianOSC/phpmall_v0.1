(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["components/basic-component/app-rich/components/wxParseTemplate1"],{"1c24":function(n,e,t){"use strict";t.r(e);var o=t("df4f"),a=t("4ea4");for(var r in a)"default"!==r&&function(n){t.d(e,n,function(){return a[n]})}(r);var c=t("2877"),i=Object(c["a"])(a["default"],o["a"],o["b"],!1,null,null,null);e["default"]=i.exports},"4ea4":function(n,e,t){"use strict";t.r(e);var o=t("daf8"),a=t.n(o);for(var r in o)"default"!==r&&function(n){t.d(e,n,function(){return o[n]})}(r);e["default"]=a.a},daf8:function(n,e,t){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var o=function(){return Promise.resolve().then(t.bind(null,"8085"))},a=function(){return Promise.all([t.e("common/vendor"),t.e("components/basic-component/app-rich/components/wxParseImg")]).then(t.bind(null,"50a5"))},r=function(){return t.e("components/basic-component/app-rich/components/wxParseVideo").then(t.bind(null,"b9a8"))},c=function(){return t.e("components/basic-component/app-rich/components/wxParseAudio").then(t.bind(null,"d2fa"))},i=function(){return t.e("components/basic-component/app-rich/components/wxParseTable").then(t.bind(null,"7194"))},s={name:"wxParseTemplate1",props:{node:{},parentNode:{}},components:{wxParseTemplate:o,wxParseImg:a,wxParseVideo:r,wxParseAudio:c,wxParseTable:i},methods:{wxParseATap:function(n,e){var t=e.currentTarget.dataset.href;if(t){var o=this.$parent;while(!o.preview||"function"!==typeof o.preview)o=o.$parent;o.navigate(t,e,n)}}}};e.default=s},df4f:function(n,e,t){"use strict";var o=function(){var n=this,e=n.$createElement,t=(n._self._c,n.__map(n.node.nodes,function(e,t){var o=e.replace(/^\s+|\s+$/g,"");return{$orig:n.__get_orig(e),g0:o}}));n.$mp.data=Object.assign({},{$root:{l0:t}})},a=[];t.d(e,"a",function(){return o}),t.d(e,"b",function(){return a})}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'components/basic-component/app-rich/components/wxParseTemplate1-create-component',
    {
        'components/basic-component/app-rich/components/wxParseTemplate1-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('f266')['createComponent'](__webpack_require__("1c24"))
        })
    },
    [['components/basic-component/app-rich/components/wxParseTemplate1-create-component']]
]);                
