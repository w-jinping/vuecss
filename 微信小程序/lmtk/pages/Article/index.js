// pages/home_product_more/index.js
var config = require('../../config.js');
Page({

  /**
   * 页面的初始数据
   */
  data: {
    config: config,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    //  wx.showLoading({
    //   title: '加载中',
    //  })
    this.article();
      var product = this;

      // wx.request({
      //   url: config.bdxht + '/Index/getListmore', //产品图片接口地址
      //   data: {},
      //   method: 'POST',
      //   header: {
      //     'content-type': 'application/x-www-form-urlencoded'
      //   },
      //   method: "GET",//get为默认方法/POST
      //   success: function (res) {
      //    wx.hideLoading();
      //     product.setData({cardlist: res.data.data });
      //    // console.log(res.data);
      //   },
      //  fail: function (res) {
      //   wx.hideLoading();
      //   console.log('获取数据失败' + res.data);
      //  },

      // })


  },
  article: function () {
    var that = this
    that.setData({
      cardlist: [
        { num: "1", url: "../../pages/view_1/index", title: "flex弹性布局学习总结", user: "wjpadmin", time:"20181028" },
        { num: "2", url: "../../pages/view_2/index", title: "HTTP和HTTPS有什么区别？ 什么是SSL证书？使用ssl证书优势？ ", user: "wjpadmin", time: "30分钟" },
      ]
    });
  },




  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})