;my.defineComponent || (my.defineComponent = Component);(my["webpackJsonp"]=my["webpackJsonp"]||[]).push([["components/basic-component/app-report-error/app-report-error"],{"0d9e":function(t,n,e){"use strict";Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var r=function(){return e.e("components/basic-component/app-form-id/app-form-id").then(e.bind(null,"8ee9"))},o={name:"app-prompt-dialog",components:{"app-form-button":r},props:{content:String},computed:{},methods:{handleClick:function(t){this.$emit("toastModelClick",t)},copyText:function(){this.$store.dispatch("gConfig/reportAndErrorB",!1),my.setClipboard({text:this.content})},refreshPage:function(){this.$store.dispatch("gConfig/reportAndErrorB",!1)}}};n.default=o},1031:function(t,n,e){"use strict";e.r(n);var r=e("e08e"),o=e("b5f7");for(var i in o)"default"!==i&&function(t){e.d(n,t,function(){return o[t]})}(i);e("9891");var a=e("2877"),c=Object(a["a"])(o["default"],r["a"],r["b"],!1,null,"74b8b4ac",null);n["default"]=c.exports},"6a01":function(t,n,e){},9891:function(t,n,e){"use strict";var r=e("6a01"),o=e.n(r);o.a},b5f7:function(t,n,e){"use strict";e.r(n);var r=e("0d9e"),o=e.n(r);for(var i in r)"default"!==i&&function(t){e.d(n,t,function(){return r[t]})}(i);n["default"]=o.a},e08e:function(t,n,e){"use strict";var r=function(){var t=this,n=t.$createElement;t._self._c},o=[];e.d(n,"a",function(){return r}),e.d(n,"b",function(){return o})}}]);
;(my["webpackJsonp"] = my["webpackJsonp"] || []).push([
    'components/basic-component/app-report-error/app-report-error-create-component',
    {
        'components/basic-component/app-report-error/app-report-error-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('c11b')['createComponent'](__webpack_require__("1031"))
        })
    },
    [['components/basic-component/app-report-error/app-report-error-create-component']]
]);                
