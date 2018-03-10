import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import {HttpService} from '../../utils/http.service'
@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.scss']
})
export class CartComponent implements OnInit {
    edit:number = 0;
    editText:string = '编辑';
    params:object = {};
    cartset: Array<any> = [];
    phone:string = '';
    username:string = 'angular';
    multiple:boolean = true;
    currentTrIndexs: Array<number> = [];
   
    api:string = 'http://localhost:88/cart';
    delApi:string = 'http://localhost:88/cartgoodsdel';
    updateApi:string = 'http://localhost:88/cartgoodsupdate';
    totalMoney:number = 0;
    qty:number = 0;
    carQty: number = 0;
    maskStatus:number = 0;
    constructor(private http:HttpService,private router:Router) { }

    ngOnInit() {
        this.phone = localStorage.getItem('phone');
        this.username = localStorage.getItem('username');

        this.http.get(this.api,this.params={userid:localStorage.getItem('id')}).then((res)=>{
            let ress = JSON.parse(JSON.stringify(res));

            if(ress.status){
                this.cartset = ress.data.results[0];
                localStorage.setItem('cartGoods',JSON.stringify(this.cartset));
            }else{
                this.cartset =[];
            }
            for(var i=0;i<this.cartset.length;i++){
                this.carQty += this.cartset[i].num*1;
            }
        })
        
        
    }
    goConfirmorder(){
        let arr =[];
        for(let i=0;i<this.currentTrIndexs.length;i++){
           arr.push(this.cartset[this.currentTrIndexs[i]]);
        }

        this.router.navigateByUrl("confirmorder");
        localStorage.setItem('cartorder', JSON.stringify(arr));
    }
    goHome(){
        this.router.navigateByUrl("home");
    }
    getKeys(item){
        return Object.keys(item);
    }
    trackByID(item){
        return item.id
    }
    cancelMask(idx){
        this.maskStatus = 0;
        this.qty ++;
        let qtyAll = this.qty+'';
        localStorage.setItem('qtyAll', qtyAll);
        console.log(qtyAll)
    }
    count(event,idx){
        let subtract = document.querySelectorAll('.glyphicon-minus-sign');
        let add = document.querySelectorAll('.glyphicon-plus-sign');
        
        if(event.target === add[idx]){
            this.cartset[idx].num++
            if(this.currentTrIndexs.length>0){
                this.qty++;
            }
            this.carQty++;
        }
        else if(event.target === subtract[idx]){
            this.cartset[idx].num--
            if(this.currentTrIndexs.length>0){
                this.qty--;
            }
            this.carQty--;
            if(this.cartset[idx].num === 0){
                this.maskStatus = 1;
                this.cartset[idx].num = 1;
                this.http.post(this.delApi,this.params={cartids:this.cartset[idx].id,userid:localStorage.getItem('id')}).then((res)=>{
                   
                })
            }
        }
       
        this.http.post(this.updateApi,this.params={cartid:this.cartset[idx].id,num:this.cartset[idx].num}).then((res)=>{
        
        })
        
    }
    mask(){
        this.maskStatus = 1;
    }

    deleteBtn(idxArray){
        //this.phone = localStorage.getItem('phone');
        let str = '';

        for(var i=0;i<idxArray.length;i++){
            str += this.cartset[idxArray[i]].id + ',';
        }
        this.http.post(this.delApi,this.params={cartids:str.slice(0,-1),userid:localStorage.getItem('id')}).then((res)=>{
           
        })
        this.maskStatus = 0;
        this.http.get(this.api,this.params={userid:localStorage.getItem('id')}).then((res)=>{
            if(JSON.parse(JSON.stringify(res)).status){
                //数组中包含对象时，需要将数据进行深拷贝操作
                this.cartset = JSON.parse(JSON.stringify(res)).data.results[0]
            }else{
                this.cartset =[]
            }
        })
        
        this.qty = 0;
        this.totalMoney = 0;
    }
    
    delEdit(){
        if(this.editText==="完成"){
            this.editText = "编辑";
            this.edit = 0;
            
        }
        else if(this.editText==="编辑"){
            this.edit = 1;
            this.editText = "完成";
        }
    }
    selectTr(_idx){
        if(this.multiple){
            if(this.currentTrIndexs.indexOf(_idx)>-1){
                this.currentTrIndexs.splice(this.currentTrIndexs.indexOf(_idx),1);
                  
                this.totalMoney -= this.cartset[_idx].num * this.cartset[_idx].price;
                this.qty -= this.cartset[_idx].num;
              
            }else{
                this.currentTrIndexs.push(_idx);
                this.totalMoney += this.cartset[_idx].num * this.cartset[_idx].price;
                this.qty += this.cartset[_idx].num;
            }
        }else{
            this.currentTrIndexs = [_idx];
        }
        
    }
    selectAll(){
        if(this.currentTrIndexs.length != this.cartset.length){
            this.currentTrIndexs = [];
            this.totalMoney = 0;
            this.qty = 0;
            
            
            for(let i=0;i<this.cartset.length;i++){
                this.currentTrIndexs.push(i);
                this.totalMoney += this.cartset[i].num * this.cartset[i].price;
                this.qty += this.cartset[i].num;
            }
        }else{
            this.currentTrIndexs = [];
            this.totalMoney = 0;
            this.qty = 0;
        }
       
    }
    
    
   
}
