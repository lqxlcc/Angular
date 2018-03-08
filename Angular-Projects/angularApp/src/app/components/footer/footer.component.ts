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
  params:object = null;
  cartQty:Array<any> = null;
  qty:number=0;
  constructor(private http:HttpService,private router:Router) { }

  ngOnInit() {
    this.http.get(this.apiCart,this.params={userid:localStorage.getItem('id')}).then((res)=>{
      console.log(res.data.results[2]);
      this.cartQty = res.data.results[2];
      for(var i=0;i<this.cartQty.length;i++){
      //console.log(this.cartQty[i].num)
        this.qty += this.cartQty[i].num*1;
      }
      console.log(this.qty);
    })
  }
  gocategory(){
     this.router.navigateByUrl("category");  
  }
  gohome(){
    this.router.navigateByUrl("home");  
  }
  gocart(){
    this.router.navigateByUrl("cart");  
  }
  gomine(){
  this.router.navigateByUrl("mine"); 
  }
  
}
