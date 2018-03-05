import { Component, OnInit } from '@angular/core';
import {Http} from '@angular/http';

@Component({
  selector: 'app-root',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.scss']
})
export class CartComponent implements OnInit {
    cartset: Array<any> = null;
    api:string = 'http://localhost:88/cart';
    constructor(private http:Http) { }

    ngOnInit() {
        this.http.get(this.api).subscribe((res)=>{
        this.cartset = res.json().data.results[0];
        console.log(this.cartset)
        })
    }
    count(event,idx){

        let subtract = document.querySelectorAll('.glyphicon-minus-sign');
        let add = document.querySelectorAll('.glyphicon-plus-sign');
        
        
        if(event.target === add[idx]){
            this.cartset[idx].num++
        }else if(event.target === subtract[idx]){
            this.cartset[idx].num--
            if(this.cartset[idx].num===0){
                this.cartset[idx].num=1;
            }
        }

    }
    getKeys(item){
        return Object.keys(item);
    }
    trackByID(item){
        return item.id
    }
}
