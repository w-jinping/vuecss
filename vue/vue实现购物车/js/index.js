var app = new Vue({
    el: '#app',
    data: {
        /**
         * 购物车中的商品列表
         */
        list: [
            {
                id: 1,
                name: '韩国进口海牌海苔',
                price: 39.9,
                count: 1
            },
            {
                id: 2,
                name: '印尼进口 Nabati 丽巧克（Richoco）休闲零食 巧克力味 威化饼干',
                price: 11.8,
                count: 1
            },
            {
                id: 3,
                name: '菲律宾进口 道吉草 奶油夹',
                price: 6.5,
                count: 1
            },
             {
                id: 6,
                name: '菲律宾进口 道吉草 奶油夹',
                price: 6.5,
                count: 1
            }
        ],
        //选中的商品列表，用于计算总价
        checkList: []
    },
    mounted: function () {
        //默认全选
        this.checkAll();
        this.checkAllElement(document.querySelector(".checkAll"));
    },
    computed: {
        /**
         * 总价
         * @returns {string}
         */
        totalPrice: function () {
            var total = 0;
            for (var i = 0; i < this.checkList.length; i++) {
                var item = this.checkList[i];
                total += item.price * item.count;
            }
            return total.toLocaleString();
        }
    },
    methods: {
        /**
         * 减少购买数量
         * @param index
         */
        reduceCount: function (index) {
            if (this.list[index].count === 1) return;
            this.list[index].count--;
        },
        /**
         * 增加购买数量
         * @param index
         */
        addCount: function (index) {
            this.list[index].count++;
        },
        /**
         * 移除商品
         * @param index
         */
        remove: function (index) {
            console.log("remove-index:" + index);
            this.list.splice(index, 1);

            //获取商品序号
            var id = index + 1;
            //移除实际参与计算的商品
            var $checkList = this.checkList;
            for (var i = 0; i < $checkList.length; i++) {
                var item = $checkList[i];
                if (item.id == id) {
                    $checkList.splice(i, 1);
                }
            }
        },
        /**
         * 全选或全不选
         * @param event
         */
        checkAllOrNot: function (event) {
            if (event.target.checked) {//全选
                this.checkAll();
                console.log("checkList：" + this.checkList);
            } else { // 全不选
                console.log("全不选");
                this.checkInItems('noCheckAll');
                this.checkList.splice(0);//清空数组
            }
        },
        /**
         * 全选
         */
        checkAll: function () {
            console.log("全选");
            this.checkInItems('checkAll');
            this.checkList = this.list.concat();//复制商品列表
        },
        /**
         * 全选或全不选
         * @param type checkAll：全选；其他：全不选
         */
        checkInItems: function (type) {
            var items = document.querySelectorAll('.checkItem');
            for (var i = 0; i < items.length; i++) {
                var item = items[i];
                if (type === 'checkAll') {
                    item.checked = true;
                } else {
                    item.checked = false;
                }
            }
        },
        /**
         * 勾选或不勾选
         */
        checkItem: function (event, index) {
            console.log("checkItem");
            var element = event.target;
            var $allCheck = document.querySelector(".checkAll");
            if (element.checked) {//勾选，加入已选择列表
                this.checkList.push(this.list[index]);
                this.checkAllElement($allCheck);
            } else {//不勾选，从已选择列表中去除
                this.checkList.splice(index, 1);
                $allCheck.checked = false;
            }
        },
        /**
         * 勾选全选框
         * @param element
         */
        checkAllElement: function (element) {
            //如果所有的商品都已被勾选，则勾选全选框
            if (this.checkList.length == this.list.length) {
                element.checked = true;
            }
        }
    }

});

