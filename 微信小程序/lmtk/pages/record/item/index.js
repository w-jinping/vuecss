Page({
  data: {
    title: '收房租',
    cate: '',
    account: '5000',
    modalHidden: true,
    alertHidden: true,
    alertTitle: '标题不能为空',
    date: ''
  },

  bindTitleInput: function (e) {
    this.setData({
      title: e.detail.value
    })
  },

  radioChange: function (e) {
    this.setData({
      cate: e.detail.value
    })
  },

  bindAccountInput: function (e) {
    this.setData({
      account: e.detail.value
    })
  },

  bindSaveInput: function () {
    let that = this;

    if (!this.data.title) {
      that.setData({
        alertHidden: false,
        alertTitle: '标题不能为空'
      });
      return;
    }

    let reg = /^[0-9]+.?[0-9]*$/;
    if (!reg.test(this.data.account)) {
      that.setData({
        alertHidden: false,
        alertTitle: '金额只能是数字'
      });
      return;
    }

    let record = {
      title: this.data.title,
      cate: this.data.cate,
      account: this.data.account,
      date: this.data.date
    };

    let data = [];

    wx.getStorage({
      key: 'db',
      success: function (res) {
        data = res.data;
        data.push(record);
        wx.setStorage({
          key: 'db',
          data: data
        });

        that.setData({
          modalHidden: false
        });
      },
    });
  },

  bindDateChange: function (e) {
    this.setData({
      date: e.detail.value
    });
  },

  onLoad: function () {
    wx.getStorage({
      key: 'db',
      fail: function () {
        wx.setStorage({
          key: 'db',
          data: []
        });
      }
    });

    let date = new Date();
    let strDate = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
    console.debug(strDate);
    this.setData({
      date: strDate
    })
  },

  hideModal: function () {
    this.setData({
      'modalHidden': true
    })
    wx.navigateBack()
  },

  hideAlertView: function () {
    this.setData({
      'alertHidden': true
    })
  }

});