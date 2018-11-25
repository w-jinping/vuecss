//获取应用实例
const app = getApp()
var config = require('../../config.js');
let _this
Page({
  data: {
    config: config,
    userInfo: {},
   // hasUserInfo: true, //默认隐藏
    canIUse: wx.canIUse('button.open-type.getUserInfo')
  },
  onLoad: function() {
    _this = this
    _this.shareAgain();
  },
  shareAgain: () => {
    wx.getSetting({
      success(res) {
        
        if (res.authSetting['scope.userInfo']) {
          wx.getUserInfo({
            lang: 'zh_CN',
            success: (res) => {
              console.log(res.userInfo)
              _this.setData({
                hasUserInfo: true,
                userInfo: res.userInfo
              })
            }
          })
        }
      }
    })

  },
});