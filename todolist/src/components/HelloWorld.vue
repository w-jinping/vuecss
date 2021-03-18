<template>
  <div class="as">
    <div class="ts">
      <input type="text" v-model="prop.addname" ref="name" placeholder="请输入内容"/>
      <button @click="add">添加</button>
    </div>
     <p v-if="show" class="red">文本框不能为空</p>
     <div class="ts">
      <input type="text" v-model="prop.eitname" ref="eitname" placeholder="请输入内容"/>
      <button @click="save">更新</button>
    </div>
     <p v-if="show1" class="red">请选择一条数据进行更新</p>
     <div class="ts">
      <input type="text" v-model="prop.seaname" ref="name" placeholder="请输入内容"/>
      <button @click="sea">搜索</button>
    </div>
   
    <div  class="dimian">
    <div v-for="(item, id) in todolist" :key="item.id" class="test">
      <span v-if="bj" class="bj" v-bind:class ="{'act':item.acti}">{{id+1}}、</span>
      <span :class="{'act':item.acti}">{{item.name}}</span>
      <div style="float: right;">
      <button @click="eit(item,id)">修改</button>
      <button @click="biaoji(item)">标记</button>
      <button @click="del(item.id)">刪除</button>
      </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  components: {},
  data() {
    return {
      id:"11", 
      show: false, //校验隐藏
      show1: false, //校验隐藏
      bj: true, //ID默认显示
      items: [
        { id: "1", name: "31省新增本土确诊15例 在北京辽宁",acti:false},
        { id: "2", name: "七部门发文助老出行" ,acti:false},
        { id: "3", name: "和嫦娥五号上天的水稻种子发芽了",acti:false},
        { id: "4", name: "2020全球最帅最美面孔",acti:false },
        { id: "5", name: "王健林手下万达老将被警方带走" ,acti:false},
        { id: "6", name: "14种独家药品平均降价超四成" ,acti:false},
        { id: "7", name: "2021元旦期间高速公路不免费" ,acti:false},
        { id: "8", name: "8旬母亲含泪送嫁 21岁养女不走了",acti:false },
        { id: "9", name: "西藏冒险王 跌落冰河前画面曝光" ,acti:false},
        { id: "10", name: "寒潮橙色预警!局地降温超16℃",acti:false },
      ],
    // items:[],
      prop:{eitname:""},
      todolist:[],//搜索重定义数组
    };
  },
  // 创建完成时
  created() {
    //重定义数组
    this.todolist = this.items;
  },
  methods: {
    //添加
    add() {
      if (this.prop.addname ==null) { //判断输入框不能为空
        this.show = true;  //显示校验提示
        return;
      }
      this.show = false; //隐藏校验
        this.items.push({
        id:this.id++,
        name:this.prop.addname,
        acti:false
      })
      console.log(this.items)
      this.prop.addname =null;  //输入框添加名称之后清空输入框内容；
      this.prop.seaname = "";
      // this.sea()
      this.todolist = this.items; 

    },

    //查询
    sea() {
      //debugger
    var keyword = this.prop.seaname;  //名称定义为keyword
    if (keyword) {
      this.todolist =this.items.filter(items => {  //遍历查询
          return items.name.indexOf(keyword) > -1 //模糊查询相关的keyword搜索关键词
       });
    }
    else{
     this.todolist = this.items; //搜索输入框显示空，点击搜索显示全部
    }
    },
    //修改
    eit(item,id) {
       this.show1 = false; //隐藏校验提示
      this.todolist[id].acti=false; //取消标记
      this.prop = {  //编辑数据，选择一条数据，名称回显到输入框里面；
        eitname: item.name,
        id: item.id,
      };
      console.log(this.prop.eitname)
    },

    //更新
    save() {
     if (this.prop.eitname =="") { //判断更新数据不能为空哦给你
        this.show1 = true;  //显示校验提示
        return;
      }
      for(var i=0; i<this.items.length; i++){ //通过遍历查找数组的值执行
        if(this.items[i].id==this.prop.id){
          this.items[i].name=this.prop.eitname
        }
      }
      this.prop.eitname="" //清空文本框
      this.show1 = false; //隐藏校验提示
    },

   // 删除
    del(id) {
        for(var i=0; i<this.items.length; i++){ //通过遍历查找数组的值执行删除操作
        if(this.items[i].id===id){
          this.items.splice(i,1);
        }
      }
      this.sea() //点击删除调用查询
    },
    //标记
      biaoji(item) {
        item.acti=!item.acti  //标记显示
        console.log(item.acti)
    },
  },

};
</script>

<style lang="less" scoped>
.bj{color: #666;font-weight: bold;}
.as {
  margin: auto;
  display: table;
  flex: 1;
  margin-top: 2%;
}
input {
  border: 1px solid #dedede;
  height: 32px;
  outline: 0;
  margin-right: 20px;
  width: 319px;
  margin-bottom: 16px;
  padding-left: 10px;
}
input:focus {
  border: 1px solid red;
  height: 32px;
  outline: 0;
  margin-right: 20px;
  margin-bottom: 16px;
  padding-left: 10px;
}
.ts {
 
  margin: auto;
  display: table;
}
.ts button {
  background: #4e6ef2;
  color: #fff;
  padding: 8px 19px 8px 19px;
  border-radius: 3px;
  border: 1px solid #4e6ef2;
  outline: 0;
}
.ts button:hover {
  background: #4662d9;
  color: #fff;
  padding: 8px 19px 8px 19px;
  border-radius: 3px;
  border: 1px solid #4e6ef2;
  outline: 0;
}
.test {
  //display: table;
  line-height: 37px;
  // border: 1px solid #dedede;
  // margin: 20px;
  // box-shadow: 0px 3px 12px 0px #dedede;
  // width: 270px;
  // padding: 15px;
}
.test:hover{color: #689;}
.test span {
  // padding: 3px 30px 3px 9px;
   padding: 0px;
}
.test button {
  color: red;
  outline: 0;
  border: 1px solid #dedede;
  margin: 2px;
  padding: 3px 6px 3px 6px;
  margin-left: 10px;
}
.test button:hover {
  color: rgb(65, 7, 42);
  outline: 0;
  border: 1px solid #dedede;
  margin: 2px;
  padding: 3px 6px 3px 6px;
  margin-left: 10px;
}
.red {
  color: red;
  text-align: center;
  padding: 0px;
  margin-top: -10px;
  margin-bottom: 6px;
}
.act{
  text-decoration: line-through;
  }
.dimian{
  width: 680px;
  padding: 8px; 
  // border:1px solid #dedede; 
  margin-top: 10px;}
</style>
