import { Component, OnInit ,Input,ElementRef} from '@angular/core';
import {HttpService} from '../../utils/http.service';
import {Router} from '@angular/router';
import global from '../../utils/global';

@Component({
  selector: 'app-list',
  templateUrl: './list.component.html',
  styleUrls: ['./list.component.scss']
})
export class ListComponent implements OnInit {
    store:Object = global;

    // 模拟跳转传来的参数
    name:string = "奇异果";
    classify:number = 1;
    sort:string ="综合";
    lifting:boolean = false;
    types:Array<object> = [];
    lists:Array<object> = [];
    keyword:string = '全部';
    keywordBool:boolean = true;
    data:Object = {};
    cartqty:number;
    showHide: boolean =false;

  constructor(private http: HttpService,private router:Router,private ref:ElementRef) { 
  }

  ngOnInit() {
    let params={classify:1,sort:this.sort,dec:this.lifting};
    //商品列表数据
    this.http.get('goodslist',params).then((res)=>{

      this.data = res['data'].results;
      console.log(res['data'].results);

      this.types = this.data[0];
      this.lists = this.data[1];
      //购物车商品数量
     this.http.get('cart',{userid:1}).then((cartRes)=>{
         console.log(cartRes);
     })

    })
  }

    gotos(event){
        this.keyword = event.target.innerText;
        
        if(this.keyword == '全部'){
          this.keywordBool = true;
        }else{
          this.keywordBool = false;
        } 
    }

    addCart(goodsid){
        //加入购物车，待做。。。
        this.http.get('cart',{id:goodsid}).then((res)=>{
          console.log();

        })
         

    }
    goProduct(ids){
        console.log(ids); 
        this.store['gid'] = ids; 
        console.log(this.store);
        this.router.navigate(["product/"+ids+ '/merchandise']);
    }
    
    goto(){
        history.go(-1);
    }

    paixu(){
        let sortUl =this.ref.nativeElement.querySelector('.sort_ul');
        console.log(sortUl.className)
        sortUl.style.display = "";
        sortUl.classList.toggle('showHide');
        
    }

}
