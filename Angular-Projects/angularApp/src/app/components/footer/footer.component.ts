import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import {HttpService} from '../../utils/http.service'

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss']
})
export class FooterComponent implements OnInit {
  apiCart:string = 'http://localhost:88/cart';

  params:object = {};

  cartQty:Array<any> = [];
  qty:number = 0;
  maskStatus:number = 0;
  
  constructor(private http:HttpService,private router:Router) { }

  ngOnInit() {
      
      this.http.get(this.apiCart,this.params={userid:localStorage.getItem('id')}).then((res)=>{

        if(JSON.parse(JSON.stringify(res)).status){
         this.cartQty = JSON.parse(JSON.stringify(res)).data.results[2]
        }else{
         this.cartQty = [];
        }
        for(var i=0;i<this.cartQty.length;i++){
          this.qty += this.cartQty[i].num*1;
        }
      })
      if(localStorage.getItem('id')==''){
        this.maskStatus = 1;
      }else{
         this.maskStatus = 0;
      }

  }
   
  gocategory(){
     this.router.navigateByUrl("category");
  }
  gohome(){
    this.router.navigateByUrl("home");
  }
  gocart(){
    this.router.navigateByUrl("cart");
    console.log(localStorage.getItem('id'))
    if(localStorage.getItem('id')==''){
      this.maskStatus = 1;
    }else{
       this.maskStatus = 0;
    }

  }
  gomine(){
    this.router.navigateByUrl("mine");

  }
  goLogin(){
    this.router.navigateByUrl("login");
  }
  cancelMask(){
    this.maskStatus = 0;
  }
}
