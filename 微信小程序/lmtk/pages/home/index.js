const app = getApp()
var config = require('../../config.js');
Page({
  data: {
    config: config,
  },

  /**分享跳转链接地址*/
  bindViewTapshare: function() {
    wx.navigateTo({
      url: '../share/index'
    })
  },
  onLoad: function() {
    this.carrlis();
},
carrlis:function(){
  var that =this
  that.setData({
    cardlist: [
      { title: "识色", href: "../../pages/index/index" },
    ]
  });
},

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function() {
  },
});