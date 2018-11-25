Page({

  data: {
    items: [],
  },

  addItem: function (e) {
    wx.navigateTo({
      url: './item/index'
    });
  },

  onShow: function () {
    let that = this;
    wx.getStorage({
      key: 'db',
      success: function (res) {
        that.setData({
          'items': res.data
        });
      }
    })
  }
});