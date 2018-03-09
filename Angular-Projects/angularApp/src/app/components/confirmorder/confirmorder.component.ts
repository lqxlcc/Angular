import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import {HttpService} from '../../utils/http.service'
@Component({
  selector: 'app-confirmorder',
  templateUrl: './confirmorder.component.html',
  styleUrls: ['./confirmorder.component.scss']
})
export class ConfirmorderComponent implements OnInit {
  cartorder:Array<any> = [];  
  num:number = 0;
  totalMoney:number = 0;
  apiOrder:string = 'http://localhost:88/orderproduct';
  params: object = {};
  orderStatus:number = 0;
  constructor(private http:HttpService,private router:Router) { }
  
  ngOnInit() {
   
    let aa = localStorage.getItem('cartorder');
    this.cartorder = JSON.parse(aa);
   
    console.log(this.cartorder);
    for(let i=0;i<this.cartorder.length;i++){
        this.num += this.cartorder[i].num;
        this.totalMoney += this.cartorder[i].price*this.cartorder[i].num;

    }
  }
  goOrderdatail(){

    this.router.navigateByUrl("orderdatail"); 
    //console.log(this.http)
    this.http.post(this.apiOrder,this.params={comfirmorders:JSON.stringify(this.cartorder),orderStatus:this.orderStatus}).then((res)=>{
    })
    this.cartorder = [];
  }
  


}
