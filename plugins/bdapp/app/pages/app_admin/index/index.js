(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/app_admin/index/index"],{"34c2":function(e,a,t){"use strict";var n=t("ca24"),i=t.n(n);i.a},5223:function(e,a,t){"use strict";(function(e){Object.defineProperty(a,"__esModule",{value:!0}),a.default=void 0;var n=s(t("a9cc")),i=t("2f62");function s(e){return e&&e.__esModule?e:{default:e}}function o(e,a){var t=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);a&&(n=n.filter(function(a){return Object.getOwnPropertyDescriptor(e,a).enumerable})),t.push.apply(t,n)}return t}function r(e){for(var a=1;a<arguments.length;a++){var t=null!=arguments[a]?arguments[a]:{};a%2?o(t,!0).forEach(function(a){c(e,a,t[a])}):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(t)):o(t).forEach(function(a){Object.defineProperty(e,a,Object.getOwnPropertyDescriptor(t,a))})}return e}function c(e,a,t){return a in e?Object.defineProperty(e,a,{value:t,enumerable:!0,configurable:!0,writable:!0}):e[a]=t,e}var d,u=function(){return t.e("components/basic-component/u-count-to/u-count-to").then(t.bind(null,"a157"))},l=null,h={components:{uCountTo:u},data:function(){return{info:{comment:0,mch:0,share:0},plugins_list:[],status:[{name:"支付金额",sign:"total_pay_price"},{name:"支付订单数",sign:"order_num"},{name:"支付人数",sign:"user_num"},{name:"支付件数",sign:"goods_num"}],plugins_active:{name:"全部",sign:"all"},canvas_plugins:{name:"全部",sign:"all"},pay_active:{name:"支付金额",sign:"total_pay_price"},_num:"1",_date:"0",choose_list:[],new_msg_num:null,all_data:{order_num:0,total_pay_price:0,user_num:0,data_num:0,wait_send_num:"--",pro_order:"--"},index:0,newIndex:0,dialog:!1,today:"",yesterday:"",weekday:"",monthday:"",area:null,id:null,is_scan_code_pay:0,cWidth:"",cHeight:"",pixelRatio:1,first:!0}},computed:r({},(0,i.mapState)({mall:function(e){return e.mallConfig.mall},adminImg:function(e){return e.mallConfig.__wxapp_img.app_admin},userInfo:function(e){return e.user.info}}),{formatNumText:function(){if("--"===this.all_data.data_num)return this.all_data.data_num;if(this.all_data.data_num){var e=function(e){var a,t={},n=1e4,i=["","万","亿","万亿"];return e<n?(t.value=e,t.unit=""):(a=Math.floor(Math.log(e)/Math.log(n)),t.value=Math.floor(e/Math.pow(n,a)*100)/100,t.unit=i[a]),t},a=this.all_data.data_num,t=e(a);return t.value+t.unit}}}),methods:{bindChange:function(e){this.newIndex=e.detail.value[0]},toggle:function(e,a){var t,n,i,s=this;switch(e?this.area=a:t=a,this._num){case"0":n="";break;case"1":n=this.today;break;case"2":n=this.yesterday;break;case"3":n=this.weekday;break;case"4":n=this.monthday;break}switch(this._date){case"0":i=this.today;break;case"1":i=this.yesterday;break;case"2":i=this.weekday;break;case"3":i=this.monthday;break}3===this.area?(this.index=this.status.indexOf(this.pay_active),this.choose_list=this.status,this.dialog=!this.dialog):this.area<3&&(1===this.area?this.index=this.plugins_list.indexOf(this.plugins_active):2===this.area&&(this.index=this.plugins_list.indexOf(this.canvas_plugins)),this.choose_list=this.plugins_list,this.dialog=!this.dialog),setTimeout(function(){if(1==t)switch(s.area){case 3:s.pay_active=s.status[s.newIndex],s.dialog=!1,s.getCanvas(i);break;case 1:s.plugins_active=s.plugins_list[s.newIndex],s.getInfo(n);break;case 2:s.canvas_plugins=s.plugins_list[s.newIndex],s.dialog=!1,s.getCanvas(i);break;default:s.dialog=!1;break}else t>0&&1!=t&&(s.newIndex=0,s.dialog=!1)},500)},tablist:function(e){switch(this._date=e.toString(),this._date){case"0":this.getCanvas(this.today);break;case"1":this.getCanvas(this.yesterday);break;case"2":this.getCanvas(this.weekday);break;case"3":this.getCanvas(this.monthday);break}this.$forceUpdate()},tab:function(e){switch(this._num=e.toString(),this._num){case"0":this.getInfo();break;case"1":this.getInfo(this.today);break;case"2":this.getInfo(this.yesterday);break;case"3":this.getInfo(this.weekday);break;case"4":this.getInfo(this.monthday);break}this.$forceUpdate()},toRedirect:function(a){e.redirectTo({url:a})},toPayment:function(){e.navigateTo({url:"/pages/app_admin/payment-code/payment-code"})},toMessage:function(){e.navigateTo({url:"/pages/app_admin/order-message/order-message"})},toReview:function(){e.navigateTo({url:"/pages/app_admin/review-message/review-message"})},toCash:function(){e.navigateTo({url:"/pages/app_admin/cash/cash"})},toComment:function(){e.navigateTo({url:"/pages/app_admin/comment/comment"})},toUser:function(){e.navigateTo({url:"/pages/app_admin/user/user?share="+this.info.share})},getDate:function(){var e=new Date,a=e.getFullYear(),t=e.getMonth()+1;t>=1&&t<=9&&(t="0"+t);var n=e.getDate();this.today=a+"-"+t+"-"+n;var i=Date.parse(new Date),s=1e3*(i/1e3-86400),o=new Date(s),r=o.getFullYear(),c=o.getMonth()+1;c>=1&&c<=9&&(c="0"+c);var d=o.getDate();this.yesterday=r+"-"+c+"-"+d;var u=1e3*(i/1e3-518400),l=new Date(u),h=l.getFullYear(),g=l.getMonth()+1;g>=1&&g<=9&&(g="0"+g);var _=l.getDate();this.weekday=h+"-"+g+"-"+_;var p=1e3*(i/1e3-2505600),f=new Date(p),m=f.getFullYear(),v=f.getMonth()+1;v>=1&&v<=9&&(v="0"+v);var y=f.getDate();this.monthday=m+"-"+v+"-"+y},getInfo:function(a){var t,n=this;e.showLoading({title:"加载中..."}),t=a==n.yesterday?n.yesterday:n.today,n.$request({url:n.$api.app_admin.index,data:{date_start:a||"",date_end:t,sign:n.plugins_active.sign},method:"post"}).then(function(a){if(e.hideLoading(),n.$hideLoading(),0==a.code){var t=[];n.info=a.data.admin_info,n.plugins_list=t.concat(a.data.plugins_list),n.new_msg_num=a.data.new_msg_num,n.all_data=a.data.all_data,n.is_scan_code_pay=a.data.is_scan_code_pay}else e.showToast({title:a.msg,icon:"none",duration:1e3})}).catch(function(a){e.hideLoading(),n.$hideLoading()})},getCanvas:function(a,t){var n=this,i=n.today;a==n.yesterday&&(i=n.yesterday),n.$request({url:n.$api.app_admin.table,data:{date_start:a,date_end:i,type:1,sign:n.canvas_plugins.sign},method:"post"}).then(function(a){if(n.$hideLoading(),0==a.code){var t=a.data.list,i={categories:[],series:[{name:"",data:[]}]};"total_pay_price"==n.pay_active.sign?(i.series[0].name="支付金额",t.forEach(function(e,a){var s=t[a].created_at;n._date<2&&(s=t[a].created_at+"时");var o={value:t[a].total_pay_price,index:t[a].created_at};i.series[0].data.push(o),i.categories.push(s)})):"order_num"==n.pay_active.sign?(i.series[0].name="支付订单数",t.forEach(function(e,a){var s=t[a].created_at;n._date<2&&(s=t[a].created_at+"时");var o={value:t[a].order_num,index:t[a].created_at};i.series[0].data.push(o),i.categories.push(s)})):"goods_num"==n.pay_active.sign?(i.series[0].name="支付件数",t.forEach(function(e,a){var s=t[a].created_at;n._date<2&&(s=t[a].created_at+"时");var o={value:t[a].goods_num,index:t[a].created_at};i.series[0].data.push(o),i.categories.push(s)})):"user_num"==n.pay_active.sign&&(i.series[0].name="支付人数",t.forEach(function(e,a){var s=t[a].created_at;n._date<2&&(s=t[a].created_at+"时");var o={value:t[a].user_num,index:t[a].created_at};i.series[0].data.push(o),i.categories.push(s)}));var s=[15,15,4,0];switch(n._date){case"0":i.categories.forEach(function(e,a){i.categories[a]=a%4==0?i.categories[a]:""}),i.categories.push("24"),s=[15,15,4,-25];break;case"1":i.categories.forEach(function(e,a){a%4!=0&&(i.categories[a]="")}),i.categories.push("24"),s=[15,15,4,-25];break;case"2":i.categories.forEach(function(e,a){i.categories[a]=i.categories[a].substring(5)});break;case"3":i.categories.forEach(function(e,a){i.categories[a]=i.categories[a].substring(5),a%4!=0&&(i.categories[a]="")});break}n.showColumn("canvasColumn",i,s)}else e.showToast({title:a.msg,icon:"none",duration:1e3})})},touchIt:function(e){var a=this;l.showToolTip(e,{format:function(e,t){return e.color="rgba(0,0,0,0)",0==a._date?t=a.today+" "+e.data.index+"时 ":1==a._date?t=a.yesterday+" "+e.data.index+"时 ":2!=a._date&&3!=a._date||(t=e.data.index),"支付金额"==e.name?t+" "+e.name+"￥"+e.data.value+"  ":t+" "+e.name+" "+e.data.value+"  "}})},showColumn:function(e,a,t){l=new n.default({$this:d,canvasId:e,type:"area",legend:{show:!1},fontSize:9,background:"#FFFFFF",colors:["#446DFD"],padding:t,pixelRatio:this.pixelRatio,categories:a.categories,series:a.series,xAxis:{disableGrid:!0},yAxis:{gridType:"dash",data:{disabled:!0}},dataLabel:!1,dataPointShape:!1,width:this.cWidth*this.pixelRatio,height:this.cHeight*this.pixelRatio,extra:{area:{type:"curve",addLine:!0},tooltip:{bgColor:"#000000",bgOpacity:.7}}})}},onLoad:function(){var a=this;a.$store.dispatch("user/refreshInfo"),a.getDate(),a._date="0",a.cWidth=e.upx2px(640),a.cHeight=e.upx2px(220)},onReady:function(){var a=this,t=setInterval(function(){a.userInfo&&(a.$showLoading({type:"global",text:"加载中..."}),clearInterval(t),0==a.userInfo.identity.is_admin?(a.$hideLoading(),e.showModal({title:"提示",content:"该帐号无管理员权限",showCancel:!1,success:function(a){e.redirectTo({url:"/pages/index/index"})}})):a.$request({url:a.$api.app_admin.index,data:{date_start:a.today,date_end:a.today,sign:"all"},method:"post"}).then(function(t){if(0==t.code){var n=[];a.info=t.data.admin_info,a.plugins_list=n.concat(t.data.plugins_list),a.new_msg_num=t.data.new_msg_num,a.all_data=t.data.all_data,a.is_scan_code_pay=t.data.is_scan_code_pay,a.getCanvas(a.today)}else e.showToast({title:t.msg,icon:"none",duration:1e3})}).catch(function(t){a.$hideLoading(),e.showModal({title:"提示",content:"该帐号无管理员权限",showCancel:!1,success:function(a){e.redirectTo({url:"/pages/index/index"})}})}))},500)}};a.default=h}).call(this,t("5486")["default"])},"5fce":function(e,a,t){"use strict";t.r(a);var n=t("6cb1"),i=t("f1d2");for(var s in i)"default"!==s&&function(e){t.d(a,e,function(){return i[e]})}(s);t("34c2");var o=t("2877"),r=Object(o["a"])(i["default"],n["a"],n["b"],!1,null,"65e3ad5a",null);a["default"]=r.exports},"6cb1":function(e,a,t){"use strict";var n=function(){var e=this,a=e.$createElement,n=(e._self._c,t("428c")),i=t("a067");e.$mp.data=Object.assign({},{$root:{m0:n,m1:i}})},i=[];t.d(a,"a",function(){return n}),t.d(a,"b",function(){return i})},ca24:function(e,a,t){},f1d2:function(e,a,t){"use strict";t.r(a);var n=t("5223"),i=t.n(n);for(var s in n)"default"!==s&&function(e){t.d(a,e,function(){return n[e]})}(s);a["default"]=i.a}},[["4dca","common/runtime","common/vendor"]]]);