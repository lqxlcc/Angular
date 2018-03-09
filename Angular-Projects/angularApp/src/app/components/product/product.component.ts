import { Component, OnInit } from '@angular/core';
import global from '../../utils/global'
import {Router,ActivatedRoute} from '@angular/router';
import {HttpService} from '../../utils/http.service';
@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.scss'],
})

export class ProductComponent implements OnInit {
    userId:string = '';
    cartQty:number = 0;
    gid:string;

    constructor(private http: HttpService,private router:Router,private route:ActivatedRoute) {
    }
    ngOnInit() {
        // 获取父组件的参数商品id
        this.gid = this.route.snapshot.paramMap.get('id');
        console.log(this.gid);

        // 获取登录者id
        this.userId = localStorage.getItem("id") || "";

        //购物车商品数量
        if(this.userId != ""){
            this.http.get('cartqty',{userid:this.userId}).then((cartRes)=>{
                let cartqtyArr = cartRes['data'].results;
                
                 for(let i=0;i<cartqtyArr.length;i++){
                     this.cartQty += cartqtyArr[i].num;
                     
                 }

            })
            
        }
    }

    goto(){
        history.go(-1);
    }
    goCart(){
        if(this.userId == ""){
            this.router.navigate(["register"]);
        }else{
            this.router.navigate(["cart"]);
        }
    }
    addCart(){
        if(this.userId != ""){
            this.http.get('addcart',{userid:this.userId,gid:this.gid}).then((cartRes)=>{
                console.log(cartRes);
                this.cartQty= 0;
                let cartqtyArr = cartRes['data'].results;
                    
                for(let i=0;i<cartqtyArr.length;i++){
                    this.cartQty += cartqtyArr[i].num;     
                }
            }) 
        }else{
            this.router.navigate(["register"]);
        }
    }

}
