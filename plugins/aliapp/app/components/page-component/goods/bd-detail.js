;my.defineComponent || (my.defineComponent = Component);(my["webpackJsonp"]=my["webpackJsonp"]||[]).push([["components/page-component/goods/bd-detail"],{"3e70":function(t,n,e){"use strict";e.r(n);var r=e("90749"),c=e("41ce");for(var i in c)"default"!==i&&function(t){e.d(n,t,function(){return c[t]})}(i);e("6f38");var o=e("2877"),u=Object(o["a"])(c["default"],r["a"],r["b"],!1,null,"d2855008",null);n["default"]=u.exports},"41ce":function(t,n,e){"use strict";e.r(n);var r=e("9c68"),c=e.n(r);for(var i in r)"default"!==i&&function(t){e.d(n,t,function(){return r[t]})}(i);n["default"]=c.a},"6f38":function(t,n,e){"use strict";var r=e("8407"),c=e.n(r);c.a},8407:function(t,n,e){},90749:function(t,n,e){"use strict";var r=function(){var t=this,n=t.$createElement;t._self._c},c=[];e.d(n,"a",function(){return r}),e.d(n,"b",function(){return c})},"9c68":function(t,n,e){"use strict";Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var r=function(){return Promise.all([e.e("common/vendor"),e.e("components/basic-component/app-rich/parse")]).then(e.bind(null,"cb0e"))},c={name:"bd-detail",components:{"app-rich-text":r},props:{detail:{type:String,default:function(){return""}}},created:function(){this.$store.dispatch("gConfig/setImageWidth",48)},computed:{newDetail:function(){var t="正在加载数据，模拟网络延迟2秒😝";return this.detail&&(t=this.detail),t}}};n.default=c}}]);
;(my["webpackJsonp"] = my["webpackJsonp"] || []).push([
    'components/page-component/goods/bd-detail-create-component',
    {
        'components/page-component/goods/bd-detail-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('c11b')['createComponent'](__webpack_require__("3e70"))
        })
    },
    [['components/page-component/goods/bd-detail-create-component']]
]);                
