import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ElMessageService } from 'element-angular';

import { HttpService } from '../../utils/http.service';

@Component({
    selector: 'app-home',
    templateUrl: './home.component.html',
    styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

    constructor(private http: HttpService,private router:Router,private message: ElMessageService) { }

    detailsAddress: string = '';
    address: string = '';
    fixer_a: boolean;
    banners: Array<string> = ['https://imgjd4.fruitday.com/images/2018-02-27/335cd282f26369758810e650c54ed247.jpg','https://imgjd5.fruitday.com/images/2018-02-28/afc5bb5589902842ef3a8e80afbb0353.jpg','https://imgjd2.fruitday.com/images/2017-11-24/830ebe6b81e6f4b058c5c1c90bd73f9b.jpg','https://imgjd1.fruitday.com/images/2018-02-27/25276a5eeb58f7803284358018f2d34d.jpg'];
    hotFruit: Array<Object> = [];
    seasonFruit: Array<Object> = [];
    meat: Array<Object> = [];
    milk:Array<Object> = [];
    moods:Array<Object> = [];
    popup: boolean;
    endX: number;
    endY: number;

    ngOnInit() {
        localStorage.setItem('history',JSON.stringify([]));
        let address = returnCitySN['cname'];
        let reg1 = /^.*省(.*市).*$/g;
        let reg2 = /^(.*市).*$/g;
        this.address = address.replace(reg1,'$1');
        this.detailsAddress = address.replace(reg2,'$1');
        this.http.get('getHomeHotFruit').then(res=>{
            this.hotFruit = res['data']['results'];
        })
        this.http.get('getHomeSeasonFruit').then(res=>{
            this.seasonFruit = res['data']['results'];
        })
        this.http.get('getHomeSeafood').then(res=>{
            this.seafood = res['data']['results'];
        })
        this.http.get('getHomeMeat').then(res=>{
            this.meat = res['data']['results'];
        })
        this.http.get('getHomeMilk').then(res=>{
            this.milk = res['data']['results'];
        })
        this.http.get('getHomeMoods').then(res=>{
            this.moods = res['data']['results'];
        })
    }

    goStart(){
      this.endX = '';
      this.endY = '';
    }

    goMove(event){
      this.endX = event.targetTouches[0].clientX;
      this.endY = event.targetTouches[0].clientY;
    }

    goDetails(event,gid){
        if(!this.endX && !this.endY){
            if(event.target.tagName.toLowerCase() != 'strong'){
              this.router.navigate(['product/' + gid + '/merchandise']);
            }
        }
    }

    addCart(event){
      if(localStorage.getItem('id')){
        let id = localStorage.getItem('id');
        let gid = event.target.getAttribute('gid');
        this.http.post('addSingleGood',{userid:id,gid:gid}).then(res=>{
          if(res['status']){
            this.handle1('success');
          }else{
            this.handle2('error');
          }
        })
      }else{
        this.popup = true;
      }
    }

    cancelAdd(){
      this.popup = false;
    }

    sureAdd(){
      this.router.navigate(['login']);
    }

    handle1(type: string): void {
    this.message.setOptions({showClose:true,center:true,customClass:'mystyle'})
        this.message[type]('已添加成功')
    }

    handle2(type: string): void {
    this.message.setOptions({showClose:true,center:true,customClass:'mystyle'})
        this.message[type]('添加失败')
    }

    goAddress(){
        this.fixer_a = true;
    }

    closeAddress(){
        this.fixer_a = false;
    }

    goAddAddress(){console.log('touchend')
        if(localStorage.getItem('id')){
            this.router.navigate(['addNewAddress']);
        }else{
            this.popup = true;
            this.fixer_a = false;
        }
    }

    goSpecial(url,arr){
        if(!this.endX && !this.endY){
            localStorage.setItem('imgurl',url);
            localStorage.setItem('specials',JSON.stringify(arr));
            this.router.navigate(['specialPull']);
        }
        return;
    }

}
