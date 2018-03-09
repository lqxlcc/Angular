import { Component, OnInit } from '@angular/core';
import {Router} from '@angular/router';
import {HttpService} from '../../utils/http.service'
@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.scss']
})
export class CartComponent implements OnInit {
    edit:number = 1;

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
    
    constructor(private http:HttpService,private router:Router) { }

    ngOnInit() {
        this.phone = localStorage.getItem('phone');
        this.username = localStorage.getItem('username');

        this.http.get(this.api,this.params={userid:localStorage.getItem('id')}).then((res)=>{
             let ress = JSON.parse(JSON.stringify(res));
             console.log(ress);

            if(ress.status){
                this.cartset = ress.data.results[0];
            }else{
                this.cartset =[];
            }
 
        })
       

    }
    goConfirmorder(){
        //console.log(this.currentTrIndexs);
        //console.log(this.cartset);
        let arr =[];
        for(let i=0;i<this.currentTrIndexs.length;i++){
           arr.push(this.cartset[this.currentTrIndexs[i]]);
            
        }
         

        this.router.navigateByUrl("confirmorder");
        localStorage.setItem('cartorder', JSON.stringify(arr));
    }
    getKeys(item){
        return Object.keys(item);
    }

    trackByID(item){
        return item.id
    }
    cancelMask(idx){
        //console.log(12)
        document.querySelector('.mask').style.display = "none";
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
            
            this.qty++;
            let qtyAll = this.qty+'';
            localStorage.setItem('qtyAll', qtyAll);
            console.log(qtyAll)
        }
        else if(event.target === subtract[idx]){
            this.cartset[idx].num--
            this.qty--;
            let qtyAll = this.qty+'';
            localStorage.setItem('qtyAll', qtyAll);
            console.log(qtyAll)
            if(this.cartset[idx].num === 0){
                document.querySelector('.mask').style.display = "block";
                this.cartset[idx].num = 1;

            }
            
        }
        //console.log(this.cartset[idx].num)
        console.log(this.http)
        this.http.post(this.updateApi,this.params={cartid:this.cartset[idx].id,num:this.cartset[idx].num}).then((res)=>{
        
        //console.log(res)
        })
        
    }
    mask(){
        document.querySelector('.mask').style.display = "block";
    }

    deleteBtn(idxArray){
        this.phone = localStorage.getItem('phone');
        let str = '';

        for(var i=0;i<idxArray.length;i++){
            str += this.cartset[idxArray[i]].id + ',';
        }
        console.log(str)
        this.http.post(this.delApi,this.params={cartids:str.slice(0,-1)}).then((res)=>{
            
            console.log(res)
        })
        

        document.querySelector('.mask').style.display = "none";
        this.http.get(this.api,this.params={userid:localStorage.getItem('id')}).then((res)=>{
            if(res.status){
                this.cartset = res.data.results[0]
            }else{
            this.cartset =[]
            }
        
        //console.log(this.cartset.length)
        })
        this.qty = 0;
        this.totalMoney = 0;
    }
    delCount(){

    }
    delEdit(){
        if(document.querySelector('.edit').innerText==="完成"){
            document.querySelector('.edit').innerText = "编辑";
            this.edit = 0;
            document.querySelector('.delCount1').style.display = "none";
            document.querySelector('.delEdit').style.display = "none";
            
        }
        else if(document.querySelector('.edit').innerText==="编辑"){
            this.edit = 1;
            document.querySelector('.edit').innerText = "完成";
            document.querySelector('.delEdit').style.display = "inline-block";
            document.querySelector('.delCount1').style.display = "none";
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
      //console.log(this.currentTrIndexs)
    }
    selectAll(){
      if(this.currentTrIndexs.length != this.cartset.length){
        this.currentTrIndexs = [];
        this.totalMoney = 0;
        this.qty = 0;
        let qtyAll = this.qty+'';
        localStorage.setItem('qtyAll', '');
        
        for(let i=0;i<this.cartset.length;i++){
            this.currentTrIndexs.push(i);
            this.totalMoney += this.cartset[i].num * this.cartset[i].price;
            this.qty += this.cartset[i].num;
            let qtyAll = this.qty+'';
            localStorage.setItem('qtyAll', qtyAll);
        
        }
      }else{
        this.currentTrIndexs = [];
        this.totalMoney = 0;
        this.qty = 0;
        localStorage.setItem('qtyAll', '');
        
      }
    }
    
    
   
}
