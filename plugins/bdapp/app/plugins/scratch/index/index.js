(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["plugins/scratch/index/index"],{"057d":function(t,e,n){"use strict";n.r(e);var i=n("6b2d"),r=n("2c65");for(var a in r)"default"!==a&&function(t){n.d(e,t,function(){return r[t]})}(a);n("153c");var s=n("2877"),o=Object(s["a"])(r["default"],i["a"],i["b"],!1,null,"31bb8c88",null);e["default"]=o.exports},"153c":function(t,e,n){"use strict";var i=n("cd0a"),r=n.n(i);r.a},"2c65":function(t,e,n){"use strict";n.r(e);var i=n("ed98"),r=n.n(i);for(var a in i)"default"!==a&&function(t){n.d(e,t,function(){return i[t]})}(a);e["default"]=r.a},"6b2d":function(t,e,n){"use strict";var i=function(){var t=this,e=t.$createElement;t._self._c},r=[];n.d(e,"a",function(){return i}),n.d(e,"b",function(){return r})},cd0a:function(t,e,n){},ed98:function(t,e,n){"use strict";(function(t){Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var i=n("2f62");function r(t,e){var n=Object.keys(t);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(t);e&&(i=i.filter(function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable})),n.push.apply(n,i)}return n}function a(t){for(var e=1;e<arguments.length;e++){var n=null!=arguments[e]?arguments[e]:{};e%2?r(n,!0).forEach(function(e){s(t,e,n[e])}):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(n)):r(n).forEach(function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(n,e))})}return t}function s(t,e,n){return e in t?Object.defineProperty(t,e,{value:n,enumerable:!0,configurable:!0,writable:!0}):t[e]=n,t}var o=function(){return n.e("components/page-component/app-share-qr-code-poster/app-share-qr-code-poster").then(n.bind(null,"409e"))},c={name:"index",components:{appShareQrCodePoster:o},computed:a({},(0,i.mapState)({appImg:function(t){return t.mallConfig.plugin.scratch.app_image},userInfo:function(t){return t.user.info}})),data:function(){var t,e,n,i,r,a,s,o;return{ctx:t,interval:e,minX:n,minY:i,maxX:r,maxY:a,lastX:s,lastY:o,logs:[],setting:null,list:null,oppty:0,msg:"",is_start:!0,is_award:!1,is_name:!1,extra_list:null,touch_end:!0,poster:this.$api.scratch.poster,poster_status:!1,shareShow:!1,userLoginShow:!1,r:16,is_integral:!1}},watch:{shareShow:function(t,e){!1===t&&!0===e&&this.init()}},onUnload:function(){clearInterval(this.interval)},onHide:function(){clearInterval(this.interval)},onShareAppMessage:function(){return this.$shareAppMessage({title:this.$children[0].navigationBarTitle,path:"/plugins/scratch/index/index",params:{}})},onShow:function(){var e=this;e.$showLoading({title:"加载中"}),e.$request({url:e.$api.scratch.index}).then(function(n){if(e.$hideLoading(),e.is_award=!1,n.data){var i=[1===n.code?n.msg:"",n.data.setting,n.data.oppty,n.data.list];e.msg=i[0],e.setting=i[1],e.oppty=i[2],e.list=i[3],e.is_integral=e.setting.deplete_integral_num>0}else t.showToast({title:n.msg,icon:"none"});e.init()}),e.prizeList(),e.interval=setInterval(function(){e.prizeList()},1e4)},methods:{register:function(){this.msg?t.showToast({icon:"none",title:this.msg}):(this.is_integral=!1,this.init())},share:function(){this.shareShow=!0},home:function(){t.redirectTo({url:"/pages/index/index"})},prize:function(){t.navigateTo({url:"/plugins/scratch/prize/prize"})},rules:function(){t.navigateTo({url:"/pages/rules/index?url=".concat(encodeURIComponent(this.$api.scratch.setting),"&keys=").concat(JSON.stringify(["setting","rule"]))})},prizeList:function(){var t=this;t.$request({url:t.$api.scratch.record}).then(function(e){0===e.code&&(t.logs=e.data)})},onStart:function(){this.init();var t=[this.setting.deplete_integral_num>0,this.extra_list,!1];this.is_integral=t[0],this.list=t[1],this.is_award=t[2]},init:function(){var e=this,n=[!0,!1];e.is_start=n[0],e.is_name=n[1],setTimeout(function(){var n=t.createSelectorQuery();n.select("#frame").boundingClientRect(),n.exec(function(n){var i=n[0].width,r=n[0].height,a="./../image/scratch_hide.png",s=["","","","","",""];e.lastX=s[0],e.lastY=s[1],e.minX=s[2],e.minY=s[3],e.maxX=s[4],e.maxY=s[5];var o=[16,i,r];e.r=o[0],e.canvasWidth=o[1],e.canvasHeight=o[2];var c=t.createCanvasContext("scratch");c.drawImage(a,0,0,i,r),e.ctx=c,c.draw(!0,function(t){e.is_name=!0})})})},drawRect:function(t,e){var n=this,i=n.r/2,r=t-i>0?t-i:0,a=e-i>0?e-i:0;if(""!==n.minX)n.minX=n.minX>r?r:n.minX,n.minY=n.minY>a?a:n.minY,n.maxX=n.maxX>r?n.maxX:r,n.maxY=n.maxY>a?n.maxY:a;else{var s=[r,a,r,a];n.minX=s[0],n.minY=s[1],n.maxX=s[2],n.maxY=s[3]}var o=[r,a];return n.lastX=o[0],n.lastY=o[1],[r,a,2*i]},clearArc:function(t,e,n){var i=this.r,r=this.ctx,a=i-n,s=Math.sqrt(i*i-a*a),o=t-a,c=e-s,u=2*a,l=2*s;n<=i&&(r.clearRect(o,c,u,l),n+=2,this.clearArc(t,e,n))},touchStart:function(e){var n=this;"User ID不能为空。"===n.msg?(this.userLoginShow=!0,n.$store.dispatch("user/info")):n.msg&&t.showToast({icon:"none",title:n.msg})},touchMove:function(t){if(this.is_start&&!this.msg){var e=2;this.drawRect(t.touches[0].x,t.touches[0].y),this.clearArc(t.touches[0].x,t.touches[0].y,e),this.ctx.draw(!0)}},touchEnd:function(e){var n=this;if(n.is_start&&!n.msg){var i=n.canvasWidth,r=n.canvasHeight,a=n.minX,s=n.minY,o=n.maxX,c=n.maxY;o-a>.4*i&&c-s>.4*r&&n.touch_end&&(n.touch_end=!1,n.$request({url:n.$api.scratch.receive,data:{id:n.list.id}}).then(function(e){if(0===e.code){n.ctx.draw();var i=[e.msg,e.data.setting,e.data.oppty,e.data.list];n.msg=i[0],n.setting=i[1],n.oppty=i[2],n.extra_list=i[3];var r=[!1,5!=n.list.type];n.is_start=r[0],n.is_award=r[1]}else t.showToast({icon:"none",content:e.msg}),n.onStart();n.touch_end=!0}))}}}};e.default=c}).call(this,n("5486")["default"])}},[["3460","common/runtime","common/vendor"]]]);