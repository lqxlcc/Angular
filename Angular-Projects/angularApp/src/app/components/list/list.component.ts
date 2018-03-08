import { Component, OnInit ,Input,ElementRef} from '@angular/core';
import {HttpService} from '../../utils/http.service';
import {Router,ActivatedRoute} from '@angular/router';
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
    sort:string ="综合";
    lifting:boolean = false;
    types:Array<object> = [];
    lists:Array<object> = [];
    keyword:string = '全部';
    keywordBool:boolean = true;
    data:Object = {};
    cartqty:number;
    showHide: boolean =false;
    smallId:string;
    bigId:string;
    userId:string = "";

  constructor(private http: HttpService,private router:Router,private ref:ElementRef,private route:ActivatedRoute) { 
  }

    ngOnInit() {
        // 获取登录者id
        this.userId = localStorage.getItem("id") || "";
        console.log(this.userId);

        //获取传过来的参数id
        this.smallId = this.route.snapshot.paramMap.get('smallid');
        this.bigId = this.route.snapshot.paramMap.get('bigid');
        let params={classify:this.bigId,sort:this.sort,dec:this.lifting};

        //商品列表数据
        this.http.get('goodslist',params).then((res)=>{
          this.data = res['data'].results;
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

    goCart(){
        if(this.userId == ""){
            this.router.navigate(["register"]);
        }else{
            this.router.navigate(["cart"]);
        }

    }
    goProduct(event,ids){
        this.store['gid'] = ids; 
        if(event.target.tagName.toLowerCase() == 'i'){
            if(this.userId == ""){
                this.router.navigate(["register"]);
            }
              //加入购物车，待做。。。
            
            // this.http.get('cart',{id:ids,userid:}).then((res)=>{
            //   console.log();

            // })
         
        }else{
            this.router.navigate(["product/"+ids+ '/merchandise']);
        }
    }
    
    goto(){
        history.go(-1);
    }

    paixu(){
        let sortUl =this.ref.nativeElement.querySelector('.sort_ul');
        // console.log(sortUl.className)
        sortUl.classList.toggle('showHide');
        
    }
    goSearch(){
        this.router.navigate(['search']);
    }

}
