(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["plugins/book/components/app-write-off-code"],{"110f5":function(t,n,e){"use strict";e.r(n);var i=e("d6b7"),a=e.n(i);for(var u in i)"default"!==u&&function(t){e.d(n,t,function(){return i[t]})}(u);n["default"]=a.a},"969b":function(t,n,e){},"979c":function(t,n,e){"use strict";var i=function(){var t=this,n=t.$createElement;t._self._c},a=[];e.d(n,"a",function(){return i}),e.d(n,"b",function(){return a})},c7ca:function(t,n,e){"use strict";var i=e("969b"),a=e.n(i);a.a},d6b7:function(t,n,e){"use strict";Object.defineProperty(n,"__esModule",{value:!0}),n.default=void 0;var i={name:"app-write-off-code",props:{hidden:{type:Boolean,default:function(){return!1}},itemId:{type:String,default:function(){return"-1"}}},data:function(){return{file_path:""}},watch:{hidden:{handler:function(t){var n=this;!0===t&&this.$request({url:this.$api.book.clerk_code,data:{id:this.itemId}}).then(function(t){0===t.code&&(n.file_path=t.data.file_path)})}}},methods:{hiddenHandler:function(){this.$emit("hiden",!1),this.file_path=""}}};n.default=i},e604:function(t,n,e){"use strict";e.r(n);var i=e("979c"),a=e("110f5");for(var u in a)"default"!==u&&function(t){e.d(n,t,function(){return a[t]})}(u);e("c7ca");var r=e("2877"),o=Object(r["a"])(a["default"],i["a"],i["b"],!1,null,"6f85493c",null);n["default"]=o.exports}}]);
;(global["webpackJsonp"] = global["webpackJsonp"] || []).push([
    'plugins/book/components/app-write-off-code-create-component',
    {
        'plugins/book/components/app-write-off-code-create-component':(function(module, exports, __webpack_require__){
            __webpack_require__('f266')['createComponent'](__webpack_require__("e604"))
        })
    },
    [['plugins/book/components/app-write-off-code-create-component']]
]);                
