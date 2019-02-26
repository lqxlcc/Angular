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
    cartQty:number = 0;
    showHide: boolean =false;
    smallId:string;
    bigId:string;
    userId:string = "";

    sort_ul:Array<string> = ['综合排序','价格高到低','价格低到高','销量'];


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
            if(this.userId != ""){
                this.http.get('cartqty',{userid:this.userId}).then((cartRes)=>{
                    let cartqtyArr = cartRes['data'].results;
                    
                     for(let i=0;i<cartqtyArr.length;i++){
                         this.cartQty += cartqtyArr[i].num;
                         
                     }

                })
                
            }

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
            }else{
                this.http.get('addcart',{userid:this.userId,gid:ids}).then((cartRes)=>{
                    console.log(cartRes);
                     this.cartQty= 0;
                     let cartqtyArr = cartRes['data'].results;
                    
                     for(let i=0;i<cartqtyArr.length;i++){
                         this.cartQty += cartqtyArr[i].num;     
                     }
                }) 
            }
            
         
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

    sorts(event){
        console.log(event.target);

        if(event.target.tagName == "LI"){

            event.target.parentNode.classList.toggle('showHide');

            let text = event.target.innerText;
            this.sort = event.target.innerText.slice(0,2);
            console.log(text);
       
               this.http.get('goodslist',{classify:this.bigId,sort:text,dec:this.lifting}).then((res)=>{
                         this.data = res['data'].results;
                        this.types = this.data[0];
                        this.lists = this.data[1];
                    }) 
            
        }
    }
}
